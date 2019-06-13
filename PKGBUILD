# Maintainer: Frédéric Potvin <frederic.potvin@platform.sh>
pkgname=platformsh-cli
pkgver='a47308373d4f5ba1a0be83607c2c22efa0124ae00e8925e1bb16abd497f9878d'
pkgrel=3.42.1
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
source=("https://github.com/platformsh/platformsh-cli/releases/download/va47308373d4f5ba1a0be83607c2c22efa0124ae00e8925e1bb16abd497f9878d/platform.phar")
sha256sums=('')
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
