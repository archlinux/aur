pkgname=python-compact-json-git
pkgver=0.0.1
pkgrel=1
pkgdesc="A JSON formatter that produces compact but human-readable"
arch=("any")
url="https://github.com/masaccio/compact-json"
license=('MIT')
makedepends=('python-setuptools')
source=("git+https://github.com/masaccio/compact-json.git")

sha256sums=('SKIP')

pkgver1(){
  cd "${srcdir}/compact-json"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build1() {
    cd "${srcdir}/compact-json"
    python -m pip install .
}

package() {
    cd "${srcdir}/compact-json"
    python -m pip install --root="$pkgdir" .
    install -Dm644 LICENSE.rst "${pkgdir}"/usr/share/licenses/python-compact-json/LICENSE
}
