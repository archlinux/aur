# Maintainer: Cleboost <clement.balarot@gmail.com>

pkgname=noctyra-cli-git
pkgver=0
pkgrel=1
pkgdesc="Noctyra CLI tool (git)"
arch=('any')
url="https://github.com/noctyra-dots/cli"
license=('MIT')
depends=('python' 'stow')
makedepends=('git')
provides=('noctyra-cli')
conflicts=('noctyra-cli')
source=("cli::git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd cli
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  install -Dm755 "cli/cli.py" "$pkgdir/usr/bin/noctyra"
}
