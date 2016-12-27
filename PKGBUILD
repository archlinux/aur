# Maintainer: Johannes Wienke <languitar@semipol.de>

pkgname=python-omemo-git
pkgver=r141.158b0a2
pkgrel=1
pkgdesc='Python OMEMO Library'
url='https://github.com/omemo/python-omemo'
license=('GPLv3')
arch=('any')
depends=('python-axolotl-git' 'python-crypto' 'protobuf')
makedepends=('python-setuptools')
provides=('python-omemo')
conflicts=('python-omemo')
source=('python-omemo::git+https://github.com/omemo/python-omemo.git')
sha256sums=('SKIP')

pkgver() {
    cd "python-omemo"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "python-omemo"
    python3 setup.py install --root="${pkgdir}" --optimize=1
}
