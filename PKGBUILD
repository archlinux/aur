# Maintainer: Dan Milon  <dan@platform.sh>
pkgname=platformsh-cli
pkgver='3.3.1'
pkgrel=1
pkgdesc="Platform.sh CLI"
arch=('any')
url="https://github.com/platformsh/platformsh-cli"
license=('MIT')
groups=()
depends=('php')
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
noextract=('platform.phar')
sha1sums=('300c51300f54edaf598d42dec240303ed1f120e7')

build() {
  mv platform.phar platform
  chmod +x platform
  ./platform self:install -y
}

package() {
  cd "$srcdir"
  install -D platform "$pkgdir//usr/bin/platform"
}
