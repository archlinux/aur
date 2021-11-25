# Maintainer: bzt <unmacaque at gmail dot com>
# Contributor: Marcos Paulino Roriz Junior <marcosrorizinf at gmail dot com>

pkgname=gnome-nds-thumbnailer
pkgver=3.0.0
pkgrel=5
pkgdesc="A thumbnailer for GNOME that will make thumbnails for Nintendo DS roms by extracting their preview icon."
arch=('i686' 'x86_64')
url="https://gitlab.gnome.org/GNOME/gnome-nds-thumbnailer"
depends=('gdk-pixbuf2' 'glib2>=2.16')
optdepends=('nautilus: required for better use of the schema')
makedepends=('gnome-common')
license=('GPL2')
_gitlabver=V_3_0_0
source=("https://gitlab.gnome.org/GNOME/$pkgname/-/archive/$_gitlabver/$pkgname-$_gitlabver.tar.gz")
sha256sums=('703cd2b6af6cfb43c9ea603b5bd680286cf92392bb940a1007225bc60a9b1aa7')

build() {
  cd ${srcdir}/${pkgname}-${_gitlabver}

  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd ${srcdir}/${pkgname}-${_gitlabver}

  make DESTDIR=$pkgdir install
}
