# Maintainer: Marco Rubin <marco.rubin@protonmail.com>

_name=concur_imgui
pkgname=python-concur-imgui
pkgver=1.3.9
pkgrel=1
pkgdesc='Cython-based Python bindings for dear imgui (Concur fork)'
arch=(x86_64)
url='https://github.com/potocpav/pyimgui'
license=('MIT')
depends=(python)
makedepends=(python-build python-installer python-wheel)
provides=(python-imgui)
conflicts=(python-imgui)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('f6e7e71ffaccedb293f5af9cc477fae873fe2d34b30e7235def3f52dfa05fa94')

build() {
    cd "$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
