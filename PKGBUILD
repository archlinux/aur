# Maintainer: JunYoung Gwak <i@jgwak.com>
# Contributor: Daniel Nunes <daniel.henri.nunes_AT_gmail_DOT_COM>

_pkgname=fontawesome
pkgname=python-${_pkgname}
pkgver=5.7.2.post1
pkgrel=1
pkgdesc="The Font Awesome icon set for python"
url="https://github.com/justbuchanan/fontawesome-python"
depends=('python' )
makedepends=('python3' 'python-setuptools' 'python-pypandoc')
license=('Apache')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
md5sums=('d10e9ee97713028609d85f0593fd890d')

build() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python setup.py install --root="$pkgdir" --optimize=1
}
