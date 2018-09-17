# Maintainer: Frédéric Potvin <frederic.potvin@platform.sh>
pkgname=platformsh-cli
pkgver='3.34.3'
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
source=("https://github.com/platformsh/platformsh-cli/releases/download/v3.34.3/platform.phar")
sha256sums=('561ed33bd3fc5869fc9f65419aeb600f2cee439624183865b2370a6e31c7bf00')
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
