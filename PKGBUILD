# Maintainer: Dan Milon  <dan@platform.sh>
pkgname=platformsh-cli
pkgver='3.22.0'
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
sha1sums=('597dd04bbf8841b27d35e1f64e7eea7ba6dcbb31')
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
