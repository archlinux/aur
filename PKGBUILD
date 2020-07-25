# Maintainer: Blair Bonnett <blair dot bonnett at gmail dot com>

pkgname=python-sphinx-copybutton
pkgver=0.3.0
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
  '4becad3a1e7c50211f1477e34fd4b6d027680e1612f497cb5b88cf85bccddaaa'
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
