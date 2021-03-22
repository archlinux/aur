# Maintainer: Łaurent ʘ❢Ŧ Ŧough <laurent dot fough at gmail dot com>

pkgname=ouilookup-py3
_pkgname=ouilookup
pkgver=0.2.3
pkgrel=1
pkgdesc="CLI tool, Python3 module for looking up hardware MAC addresses from the published OUI source at ieee.org"
arch=('i686' 'x86_64')
url="https://github.com/verbnetworks/ouilookup"
license=('BSD')
depends=('python>=3.0')
makedepends=('python-setuptools')
source=(https://github.com/verbnetworks/ouilookup)
options=(emptydirs)
sha256sums=('SKIP')
source=(
	"${_pkgname}::git://github.com/verbnetworks/ouilookup#branch=${BRANCH:-master}"
)


package() {

    cd "${srcdir}/${_pkgname}"
    python setup.py install --root="$pkgdir/" --optimize=1
    # license
    install -D -m644 "${srcdir}"/${_pkgname}/LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"

}
