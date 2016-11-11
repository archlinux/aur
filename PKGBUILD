# Maintainer: Johannes Wienke <languitar@semipol.de>

pkgname=wtrack-git
pkgver=0.1.dev0.g9ca27c4
pkgrel=1
pkgdesc="Work time tracker"
arch=(any)
url="https://github.com/languitar/wtrack"
license=('LGPL3')
depends=('python3' 'python-pandas' 'python-matplotlib' 'python-icalendar')
makedepends=('git' 'python-setuptools')
source=("${pkgname}::git://github.com/languitar/wtrack.git")
md5sums=('SKIP')

pkgver() {
    cd "$pkgname"
    printf "%s.g%s" "$(python setup.py --version 2> /dev/null)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "$pkgname"
    python3 setup.py install --root="$pkgdir/"
}
