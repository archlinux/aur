pkgname=python-vici
_pypi_pkgname=vici
pkgver=5.8.0
pkgrel=2
pkgdesc="vici python egg to talk to strongSwan via VICI socket"
arch=(any)
url="https://strongswan.org"
license=('GPL2')
makedepends=('python-setuptools')
depends=('python')
source=("https://files.pythonhosted.org/packages/f7/5b/59a1b82929255dca851bbef8ff368ea465d5adfa7c6a8b50824bcf6c2f6e/vici-5.8.0.tar.gz")
sha256sums=('de0b9029e5c4ab16f293567dd56b59de2ad1984dd18a3980c787573aeb44b88a')

build() {
    cd "${srcdir}/${_pypi_pkgname}-${pkgver}"
    python setup.py build || return 1
}

package() {
    cd "${srcdir}/${_pypi_pkgname}-${pkgver}"
    python setup.py install --root=${pkgdir} --optimize=1 || return 1
}
