# Maintainer: William Ghazarian <lvswgh at proton dot me>
# Contributor: 

pkgname="marvin-cli-bin"
pkgver=1.5.0
pkgrel=1
pkgdesc="A command-line tool for interfacing with the Amazing Marvin desktop app and public API. (unofficial)"
arch=("x86_64")
url="https://github.com/k-and/marvin-cli"
license=("MIT")
depends=()
options=('!debug' '!strip')
optdepends=()
provides=('marvin-cli')
conflicts=('marvin-cli')
source=(
  "$pkgname-$pkgver::https://github.com/k-and/marvin-cli/releases/download/v$pkgver/marvin-cli-linux"
  "LICENSE-$pkgname-$pkgver::https://raw.githubusercontent.com/k-and/marvin-cli/v$pkgver/LICENSE"
)
sha256sums=('968c70ec54b313dc3ae791c0b5acb9c7f0daf39c1ec537c03663ba1bfed4fc15'
            '8c87c28eb30561ffc93653d15087a2364fbd522b17895620823bcd5efc96632c')

package() {
  install -Dm755 "$srcdir/$pkgname-$pkgver" "$pkgdir/usr/bin/marvin"

  install -Dm644 LICENSE-$pkgname-$pkgver "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}