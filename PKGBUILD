# Contributor: a821 at mail dot de
# Contributor: Trevor <assviolat0r at live dot com>

pkgname=python-rivescript
pkgver=1.15.0
pkgrel=1
pkgdesc="Rendering Intelligence Very Easily"
arch=('any')
license=('MIT')
depends=('python-six')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
url="https://github.com/aichaos/rivescript-python"
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('d148a9242ea88f2a5f3dd57a663a4ddd56729807ee24edcd37ade7ee690e1bfe')

build() {
   cd rivescript-python-$pkgver
   python -m build --wheel --no-isolation
}

package() {
   cd rivescript-python-$pkgver
   python -m installer --destdir="$pkgdir" dist/*.whl
   install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
