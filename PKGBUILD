# Maintainer: Kevin Kaland <kevin@wizone.solutions>
pkgname=platformsh-cli
pkgver=3.57.5
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
sha256sums=('df6d8baf36d6229b12cdb93f57f49c719554fbed36b2b0266b4af6e9f9ba1f2b')
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
