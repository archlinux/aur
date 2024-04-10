# Maintainer: Chris Billington <chrisjbillington@gmail.com>
pkgname=interminal
pkgver=0.4.0
pkgrel=1
pkgdesc="Utility for launching commands in a GUI terminal"
url="https://github.com/chrisjbillington/interminal"
makedepends=(python-build python-installer python-wheel python-setuptools )
depends=(python-pexpect)
license=('BSD')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('25fb58cf35bbdc1ca4b77fe6bc9b04f735bd5028ef07bb6f3c0b3ddef500ed92')

build() {
    cd $pkgname-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd $pkgname-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
}
