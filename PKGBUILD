# Maintainer: Frédéric Potvin <frederic.potvin@platform.sh>
pkgname=platformsh-cli
pkgver='3.30.1'
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
source=("https://github.com/platformsh/platformsh-cli/releases/download/v3.30.1/platform.phar")
sha256sums=('e6565355887b32f6b98640d8599ab72d9f4f109772e6ec83ffdd005353460c6b')
noextract=('platform.phar')

build() {
  mv platform.phar platform
  chmod +x platform
  mkdir -p ~/.platformsh
  ./platform self:install -y
}

package() {
  cd "$srcdir"
  install -D platform "$pkgdir/usr/bin/platform"
}
