# Maintainer: Johannes Wienke <languitar@semipol.de>

pkgname=i3-workspace-switch-git
pkgver=r0.2.dev0.gcb7f6de
pkgrel=2
pkgdesc="Utility to allow switching workspaces by their position on the output"
arch=(any)
url="https://github.com/languitar/i3-workspace-switch"
license=('LGPL3')
depends=('python2' 'python-i3-git')
makedepends=('git' 'python-setuptools')
source=("${pkgname}::git://github.com/languitar/i3-workspace-switch.git")
md5sums=('SKIP')

pkgver() {
    cd "$pkgname"
    printf "r%s.g%s" "$(python3 setup.py --version 2> /dev/null)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "$pkgname"
    python3 setup.py install --root="$pkgdir/"
}
