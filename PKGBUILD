# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgname=valknut
pkgver=0.4.9
pkgrel=2
pkgdesc="A direct connect client for Linux (like dc++), with segmented downloading"
license=('GPL')
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/wxdcgui/"
depends=('qt4' 'dclib>=0.3.23')
replaces=('dcgui-qt')
source=(http://downloads.sourceforge.net/sourceforge/wxdcgui/$pkgname-$pkgver.tar.bz2
        $pkgname.patch)
md5sums=('c25d68c447cb9deb4262befdde9fccea'
         'e700bc3ef6221a9e36421e888c5a2e28')

prepare() {
  cd "${srcdir}"/$pkgname-$pkgver

  patch -Np1 -i "${srcdir}/valknut.patch"
}

build() {
  cd "${srcdir}"/$pkgname-$pkgver

  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}"/$pkgname-$pkgver

  make prefix="${pkgdir}/usr" install
}
