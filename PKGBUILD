# Maintainer: Dan Milon  <dan@platform.sh>
pkgname=platformsh-cli
pkgver='3.22.3'
pkgrel=1
pkgdesc="Platform.sh CLI"
arch=('any')
url="https://github.com/platformsh/platformsh-cli"
license=('MIT')
groups=()
depends=('php>=5.4.0')
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
source=("https://github.com/platformsh/platformsh-cli/releases/download/v$pkgver/platform.phar")
sha256sums=('7e354f61a964a7ebd34d458deb1a45646ddb77cb0a43ee804d26ae8380c1d7fa')
noextract=('platform.phar')

build() {
  mv platform.phar platform
  chmod +x platform
  mkdir -p ~/.platform
  ./platform self:install -y
}

package() {
  cd "$srcdir"
  install -D platform "$pkgdir//usr/bin/platform"
}
