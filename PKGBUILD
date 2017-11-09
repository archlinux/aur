# Maintainer: Dan Milon  <dan@platform.sh>
pkgname=platformsh-cli
pkgver='3.22.2'
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
sha256sums=('b3622edb90a035d0e28f1eddb807cc266f3941d2ef809e5b75dbc4e790981df2')
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
