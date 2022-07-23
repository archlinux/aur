# Maintainer: Marco Rubin <marco.rubin@protonmail.com>

_name=concur
pkgname=python-$_name
pkgver=0.10.0
pkgrel=1
pkgdesc='Concur UI Framework for Python'
arch=(any)
url='https://github.com/potocpav/python-concur'
license=('MIT')
depends=(python python-concur-imgui)
makedepends=(python-build python-installer python-wheel)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('c1773837e6e5fb5dcbe533d12954e3a18bdbf3881f2cc1038a86fb12ee517d72')

build() {
    cd "$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 ../../LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
