# Maintainer: Johannes Wienke <languitar@semipol.de>

pkgname=pass-git-helper-git
pkgver=1.2.0.r59.g9cc9f0b
pkgrel=1
pkgdesc="A git credential helper interfacing with pass, the standard unix password manager"
arch=(any)
url="https://github.com/languitar/pass-git-helper"
license=('LGPL3')
depends=('python3' 'pass')
makedepends=('git' 'python-setuptools')
conflicts=('pass-git-helper')
provides=('pass-git-helper')
source=("${pkgname}::git+https://github.com/languitar/pass-git-helper.git")
md5sums=('SKIP')

pkgver() {
    cd "$pkgname"
    git describe --long --tags | sed 's/^v//;s/-/.r/;s/-/./'
}

package() {
    cd "$pkgname"
    python3 setup.py install --root="$pkgdir/"
}
