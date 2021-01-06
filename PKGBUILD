# Maintainer: Cilyan Olowen <gaknar@gmail.com>
pkgname=python-sphinxcontrib-needs
_name=${pkgname#python-}
pkgver=0.6.0
pkgrel=1
pkgdesc="Sphinx needs extension for managing needs/requirements and specifications"
arch=("any")
url="http://github.com/useblocks/sphinxcontrib-needs"
license=('MIT')
depends=('python-sphinx' 'python-matplotlib' 'python-six')
makedepends=()
optdepends=('python-sphinxcontrib-plantuml: for needflow')
source=(
    "https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz"
    "https://raw.githubusercontent.com/useblocks/$_name/$pkgver/LICENSE"
)
sha256sums=('fb7c163410e32b286435f53e4ce06cf91f9de59262abc7ae7b6170373105060e'
            'fe4ddb344f410de4b564938d0c3eb76905142764ccd9835ee6c3674b0f288e00')

build() {
    cd "$_name-$pkgver"
    python setup.py build
}

package() {
    cd "$_name-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
    install -Dm644 -t "$pkgdir"/usr/share/licenses/$pkgname "$srcdir"/LICENSE
}
