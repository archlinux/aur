# Maintainer: Iamnotagenius <kazakk9@gmail.com>
pkgname=bevm
pkgver=1.12 # Версия проги
pkgrel=1 # Номер релиза
pkgdesc="A God's basic evm"
arch=('any')
url="https://github.com/JustAGod1/bevm"
license=('GPL')
depends=('glibc' 'sdl2' 'gtk3' 'gcc-libs')
makedepends=('git' 'rust')
source=("$pkgname-$pkgver"::"git+https://github.com/JustAGod1/bevm")
md5sums=('SKIP') #autofill using updpkgsums

build() {
  cd "$pkgname-$pkgver"
  git checkout v$pkgver
  ./linux.sh
}

package() {
  mkdir -p "$pkgdir/usr/bin"
  cp "$srcdir/$pkgname-$pkgver/target/release/evm" "$pkgdir/usr/bin/"
}
