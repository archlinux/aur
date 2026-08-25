# Maintainer: Harryhaha <harry_haha@foxmail.com>

pkgname=python-libtwlpy
_name=libtwlpy
pkgver=0.1.0
pkgrel=1
pkgdesc='A modern Python library for handling files and formats used by the DSi.'
url='https://github.com/NinjaCheetah/libTWLPy'
license=('MIT')
arch=('any')
provides=("python-${_name}")
conflicts=("python-${_name}")
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-pycryptodome' 'python-requests')

source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name//-/_}/${_name//-/_}-$pkgver.tar.gz")

sha256sums=('da81d542520b099a8cccd6fb0af13b221d5cc2f99878dfe5b23591df20e16a96')

build() {
    cd $_name-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd $_name-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
