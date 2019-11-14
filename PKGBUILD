# Maintainer: Kevin Azzam <aur@azz.am>

_pipname=invocations
_license=LICENSE
pkgbase=python-invocations
pkgname=('python-invocations')
pkgver=1.4.0
pkgrel=3
pkgdesc="Reusable Invoke tasks"
arch=('any')
url="https://github.com/pyinvoke/invocations"
license=('BSD')
makedepends=('python-setuptools')
source=("https://pypi.io/packages/source/i/invocations/invocations-$pkgver.tar.gz")
md5sums=('557a68735e9bb62af94f0c0517425821')


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
