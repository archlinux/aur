#Maintainer digital mystik <echo ZGlnaXRhbF9teXN0aWtAcHJvdG9ubWFpbC5jaAo= | base64 -d>

pkgname=python-bech32
pkgver=1.2.0
pkgrel=1
pkgdesc="Pieter Wuille's reference implementation for Bech32 and segwit addresses"
arch=('any')
url="https://github.com/fiatjaf/bech32"
license=("GPL3")
depends=('python')
makedepends=('python-setuptools' 'git')
source=("${pkgname}::git+https://github.com/fiatjaf/bech32.git#branch=master")

b2sums=('SKIP')

#source does not have tags currently

#pkgver() {
#    cd "${pkgname}"
#    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
#}

build() {
    cd "$srcdir/$pkgname"
    python setup.py build
}

package() {
    cd "$srcdir/$pkgname"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
