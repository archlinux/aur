# Maintainer: Christian Pfeiffer <cpfeiffer at live dot de>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: jwwolf <jwwolf+arch@gmail.com>
# Contributor: Bernhard Walle <bernhard@bwalle.de>

pkgname=crosstool-ng
pkgver=1.24.0
pkgrel=2
pkgdesc='Versatile (cross-)toolchain generator'
arch=('x86_64')
url='http://crosstool-ng.org/'
license=('GPL')
depends=('git' 'gperf' 'help2man' 'lzip' 'ncurses' 'python' 'unzip')
source=("http://crosstool-ng.org/download/$pkgname/$pkgname-$pkgver.tar.xz"
		"http://crosstool-ng.org/download/$pkgname/$pkgname-$pkgver.tar.xz.sig")
sha512sums=('89b8794a4184ad4928750e29712ed4f194aa1d0b93768d67ff64f30c30f1b1e165647cafc6de94d68d3ef70e50446e544dad65aa36137511a32ee7a667dddfb4'
            'SKIP')
validpgpkeys=('64AAFBF214758C63409345F97848649B11D618A4')

build() {
  cd "$pkgname-$pkgver"
  ./configure --prefix=/usr --with-bash-completion --with-ncurses --libexecdir=/usr/lib/crosstool-ng
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
