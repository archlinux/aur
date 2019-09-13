# Maintainer: Blair Bonnett <blair dot bonnett at gmail dot com>

pkgname=python-sphinx-copybutton
pkgver=0.2.5
pkgrel=1
pkgdesc="A Sphinx extension to add a \"copy\" button to code blocks"
url="https://github.com/choldgraf/sphinx-copybutton"
arch=('any')
license=('MIT')
depends=('python-sphinx')
source=(
  "https://files.pythonhosted.org/packages/source/s/sphinx-copybutton/sphinx-copybutton-$pkgver.tar.gz"
)
sha256sums=(
  "94593d9fd7318fa119ae4144fc99a91cb5cd4523adb363b6a93ee9b2ad0160ae"
)

build() {
    cd "sphinx-copybutton-$pkgver"
    python setup.py build
}

package() {
    cd "sphinx-copybutton-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
