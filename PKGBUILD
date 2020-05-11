# Maintainer: Kevin Kaland <kevin@wizone.solutions>
pkgname=platformsh-cli
pkgver=3.54.2
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
sha256sums=('75416fc0789bed9c5c12e89259420b8af66601479b80b0dc55a73cdf34f46879')
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
