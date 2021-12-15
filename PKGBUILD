# Maintainer: Iamnotagenius <kazakk9@gmail.com>
pkgname=bevm-git
pkgver=1.10 # Версия проги
pkgrel=1 # Номер релиза
pkgdesc="A God's basic evm"
arch=('any')
url="https://github.com/JustAGod1/bevm"
license=('GPL')
depends=('glibc' 'sdl2' 'gtk3' 'gcc-libs')
makedepends=('git' 'rust')
provides=('bevm')
source=("$pkgname-$pkgver"::"git+https://github.com/JustAGod1/bevm")
md5sums=('SKIP') #autofill using updpkgsums

build() {
  cd "$pkgname-$pkgver"
  ./linux.sh
}

package() {
  mkdir -p "$pkgdir/usr/bin"
  cp "$srcdir/$pkgname-$pkgver/target/release/evm" "$pkgdir/usr/bin/"
}
