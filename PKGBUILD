# Maintainer: Johannes Wienke <languitar@semipol.de>

pkgname=pass-git-helper-git
pkgver=0.2.dev0.g42075f0
pkgrel=1
pkgdesc="A git credential helper interfacing with pass, the standard unix password manager"
arch=(any)
url="https://github.com/languitar/pass-git-helper"
license=('LGPL3')
depends=('python3' 'pass')
makedepends=('git' 'python-setuptools')
conflicts=('pass-git-helper')
provides=('pass-git-helper')
source=("${pkgname}::git://github.com/languitar/pass-git-helper.git")
md5sums=('SKIP')

pkgver() {
    cd "$pkgname"
    printf "%s.g%s" "$(python setup.py --version 2> /dev/null)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "$pkgname"
    python3 setup.py install --root="$pkgdir/"
}
