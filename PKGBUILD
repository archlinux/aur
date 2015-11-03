# Maintainer: Yuexuan Gu <lastavengers@outlook.com>
pkgname=pnmixer-gtk3
pkgver=0.6.1
pkgrel=2
pkgdesc="a simple mixer application designed to run in your system tray."
arch=('i686' 'x86_64')
license=('GPL')
url="https://github.com/nicklan/pnmixer"
depends=('gtk3' 'alsa-lib' 'libx11' 'libnotify')
makedepends=('intltool')
conflicts=('pnmixer-git' 'pnmixer-gtk2' 'pnmixer')

source=(https://github.com/nicklan/pnmixer/archive/v${pkgver}.tar.gz)
sha512sums=('6980e54e1894e7ba9a54b3a7b794cebd065093682b0cd6b50f99b4fd2059ef966fd755a034e0055eec9c4ff9fec8215dd1f8c7e7cc2364c5e20f90f0c174f6a7')

build() {
  cd ${pkgname%-gtk3}-$pkgver

  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd ${pkgname%-gtk3}-$pkgver

  make DESTDIR="$pkgdir" install
}
