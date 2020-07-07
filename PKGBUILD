# Maintainer: Kevin Kaland <kevin@wizone.solutions>
pkgname=platformsh-cli
pkgver=3.57.6
pkgrel=1
pkgdesc="Platform.sh CLI"
arch=('any')
url="https://github.com/platformsh/platformsh-cli"
license=('MIT')
groups=()
depends=('php>=5.5.9')
makedepends=()
checkdepends=()
optdepends=()
provides=('platformsh-cli')
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("$pkgname-$pkgver.phar::https://github.com/platformsh/platformsh-cli/releases/download/v$pkgver/platform.phar")
sha256sums=('9358ac46166b28768d56cb5a6d0e08f52987e16e73659962ae1412cf36fac1ae')
noextract=('$pkgname-$pkgver.phar')

build() {
  mv $pkgname-$pkgver.phar platform
  chmod +x platform
  mkdir -p ~/.platformsh
  ./platform self:install -y
}

package() {
  cd "$srcdir"
  install -D platform "$pkgdir/usr/bin/platform"
}
