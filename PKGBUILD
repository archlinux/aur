# Maintainer: Letu Ren <fantasquex at gmail dot com>
# Contributor: Sumner Evans <sumner.evans98 at gmail dot com>

pkgbase='python-pdfkit'
pkgname=('python-pdfkit')
pkgver='1.0.0'
pkgrel=1
pkgdesc='Wkhtmltopdf python wrapper to convert html to pdf '
arch=('any')
url='https://github.com/JazzCore/python-pdfkit'
license=('MIT')
depends=(
    'python'
    'wkhtmltopdf'
)
makedepends=('python-setuptools')
_name=${pkgname#python-}
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('992f821e1e18fc8a0e701ecae24b51a2d598296a180caee0a24c0af181da02a9')

build() {
    cd "${_name}-${pkgver}"
    python setup.py build
}

package() {
    cd "${_name}-${pkgver}"
    python setup.py install --root="$pkgdir" --optimize=1
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

