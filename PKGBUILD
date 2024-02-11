# Maintainer: Kevin Azzam <aur@azz.am>

_pipname=invocations
_license=LICENSE
pkgbase=python-invocations
pkgname=('python-invocations')
pkgver=3.3.0
pkgrel=1
pkgdesc="Reusable Invoke tasks"
arch=('any')
url="https://github.com/pyinvoke/invocations"
license=('BSD')
makedepends=('python-setuptools')
source=("https://pypi.io/packages/source/i/invocations/invocations-$pkgver.tar.gz")
sha256sums=('caa950dad1842f89074e4bc241958dc3acc3b36c39a94e8c08c3ea5b5f7e992f')


build() {
    cd "${srcdir}/${_pipname}-${pkgver}"
    python setup.py build
}

package() {
    depends=('python-invoke')

    cd "${srcdir}/${_pipname}-${pkgver}"
    python setup.py install --root="$pkgdir/" --optimize=1

    install -D -m644 "${_license}" "$pkgdir"/usr/share/licenses/$pkgname/"${_license}"
}
