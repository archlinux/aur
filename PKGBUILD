# Maintainer: Kevin Kaland <kevin@wizone.solutions>
pkgname=platformsh-cli
pkgver=3.57.2
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
sha256sums=('4a76caf61a5e98721bd18893678bc1b800b4713303e5e696b61285bac1e9fec4')
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
