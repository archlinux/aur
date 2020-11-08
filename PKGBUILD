# Maintainer: Blair Bonnett <blair dot bonnett at gmail dot com>

pkgname=python-sphinx-copybutton
pkgver=0.3.1
pkgrel=1
pkgdesc="Sphinx extension to add a \"copy\" button to code blocks"
url="https://sphinx-copybutton.readthedocs.io/"
arch=('any')
license=('MIT')
depends=('python-sphinx')
makedepends=('python-setuptools')
source=(
  "https://files.pythonhosted.org/packages/source/s/sphinx-copybutton/sphinx-copybutton-$pkgver.tar.gz"
)
sha256sums=(
  '0e0461df394515284e3907e3f418a0c60ef6ab6c9a27a800c8552772d0a402a2'
)

build() {
    cd "sphinx-copybutton-$pkgver"
    python setup.py build
}

package() {
    cd "sphinx-copybutton-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1 --prefix=/usr --skip-build
    install -D -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
    install -D -m644 -t "${pkgdir}/usr/share/doc/${pkgname}" README.md
}
