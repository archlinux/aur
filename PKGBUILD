# Maintainer:
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Tobias Kieslich <tobias@archlinux.org>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>

pkgname=obconf
pkgver=2.0.4
pkgrel=5
pkgdesc="A GTK2 based configuration tool for the Openbox windowmanager"
arch=('x86_64')
url="http://openbox.org/wiki/ObConf:About"
license=('GPL')
depends=('openbox' 'gtk2' 'libglade' 'desktop-file-utils' 'libsm' 'libobrender.so')
source=("http://openbox.org/dist/$pkgname/$pkgname-$pkgver.tar.gz"{,.asc})
md5sums=('9271c5d2dc366d61f73665a5e8bceabc'
         'SKIP')
validpgpkeys=(1FEECBB03AB7D3216B5E0AC9274E52855D203EC3)

build() {
  cd "${srcdir}"/${pkgname}-${pkgver}

  #./bootstrap
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}"/${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install
}
