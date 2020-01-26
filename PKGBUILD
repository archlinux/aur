# Maintainer: Martin Knudsen <martin.knudsen@gmail.com>

pkgname=swamp
pkgver=0.11.0
pkgrel=1
pkgdesc="Teh AWS profile manager"
arch=('x86_64'  )
url="https://github.com/felixb/swamp"
license=('MIT')
makedepends=('go')
options=('!strip' '!emptydirs')
source=("https://github.com/felixb/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('58c517f21160e19015d98a758a94bf8ebfc390cf1b3532c360cc890378ad5163')

build() {
  cd "$pkgname-$pkgver"

  case "$CARCH" in
    x86_64)
      make
      ;;
    *)
      echo "No suitable build available."
      exit 127
      ;;
  esac
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm755 "build/${pkgname}" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
