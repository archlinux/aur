# Maintainer: JunYoung Gwak <aur@jgwak.com>
# Contributor: Daniel Nunes <daniel.henri.nunes_AT_gmail_DOT_COM>

_pkgname=fontawesome
pkgname=python-${_pkgname}
pkgver=5.10.1.post1
pkgrel=1
pkgdesc="The Font Awesome icon set for python"
url="https://github.com/justbuchanan/fontawesome-python"
depends=('python' )
makedepends=('python3' 'python-setuptools' 'python-pypandoc')
license=('Apache')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
md5sums=('13d48226fb352f6d9affc2c497821a80')

build() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python setup.py install --root="$pkgdir" --optimize=1
}
