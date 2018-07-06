# Maintainer: Chris Kitching <chriskitching@linux.com>

pkgname=tplink-smartplug-git
pkgver=r25.395c352
pkgrel=1
pkgdesc="A CLI for interacting with TP-Link HS100, HS110, and HS105 smartplugs"
license=("Apache")
url='https://github.com/softScheck/tplink-smartplug'
arch=("any")
depends=('python2')

source=(
    "$pkgname::git+https://github.com/softScheck/tplink-smartplug"
)
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/tplink-smartplug-git"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "${srcdir}/tplink-smartplug-git"
    install -Dt "${pkgdir}/usr/bin" "tplink_smartplug.py"
    install -Dt "${pkgdir}/usr/share/tplink-smartplug" "LICENSE" "README.md"
}
