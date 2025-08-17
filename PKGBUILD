# Maintainer: jonc4
pkgname=set-mouse-config-git
pkgver=r1.6f268e9
pkgrel=1
pkgdesc="Switch libratbag mouse profiles via ratbagctl (git version)"
arch=('any')
url="https://github.com/JonPC4/set-mouse-config"
license=('MIT')
depends=('bash' 'libratbag')
optdepends=('ripgrep: faster device detection if you use rg instead of awk/grep')
provides=('set-mouse-config' 'smc')
conflicts=('set-mouse-config')
source=("git+https://github.com/JonPC4/set-mouse-config.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/set-mouse-config"
  git describe --tags --long 2>/dev/null \
    || printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  set -x
  cd "$srcdir/set-mouse-config"
  install -Dm755 smc "$pkgdir/usr/bin/smc"
}
