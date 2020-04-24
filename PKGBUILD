# Maintainer: Blair Bonnett <blair dot bonnett at gmail dot com>

pkgname=python-sphinx-copybutton
pkgver=0.2.11
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
  'cf3bb6dc4b82217fe1a765d733aa478949ae8574670aa2c5e7c94de81326ad50'
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
