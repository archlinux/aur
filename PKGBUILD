# Maintainer: Attenuation <ouyangjun1999@gmail.com>
pkgname=ttv
pkgver=0.2.2
pkgrel=1
pkgdesc='A command line tool for splitting files into test, train, and validation sets. '
arch=('x86_64')
url='https://github.com/sd2k/ttv'
license=('CUSTOM')
makedepends=('rust')
depends=()
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('6901f8b79d4e984ce83f8c016970527bdcb136c39df94d31c48aca5134dcde5f5f7d967356c1614be69279c0dea61d1cc6ff58a99e193f27e68eb72f04cdfc7c')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 target/release/$pkgname "$pkgdir/usr/bin/$pkgname"
}
