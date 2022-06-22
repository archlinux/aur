# Maintainer: Michael Lass <bevan@bi-co.net>

# This PKGBUILD is maintained on github:
# https://github.com/michaellass/AUR

pkgname=meshwatch-git
_name=meshwatch
pkgver=r96.35f4723
pkgrel=1
pkgdesc="Communicate with Meshtastic devices using python."
arch=('any')
url="https://github.com/datagod/meshwatch"
license=('BSD')
depends=('meshtastic-python')
conflicts=('meshwatch')
provides=('meshwatch')
source=("git+https://github.com/datagod/meshwatch.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_name"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "$_name"

    install -Dm755 meshwatch.py "$pkgdir"/usr/bin/meshwatch
    install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
