# Maintainer: Andrew Sun <adsun701 at gmail dot com>
# Contributor: Marius Nestor <marius at softpedia dot com>

pkgname=gnome-directory-thumbnailer
pkgver=0.1.11
pkgrel=1
pkgdesc="GNOME thumbnailer to generate thumbnails for directories"
arch=('x86_64' 'i686')
url="https://gitlab.gnome.org/GNOME/gnome-directory-thumbnailer"
license=('LGPL2.1')
depends=('gnome-desktop')
makedepends=('intltool')
source=("https://download.gnome.org/sources/$pkgname/${pkgver%.*}/$pkgname-$pkgver.tar.xz")
sha256sums=('57fba723521ff21aa2f655c22dc3e1e66586bb1effef8dbaf5de4d027f70cf9d')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
