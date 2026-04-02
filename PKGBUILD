# Maintainer: attackuwu911 <daniil.baskakov13@gmail.com>

pkgname=python-discord_rpc
_name=discord_rpc
pkgver=5.5
pkgrel=1
pkgdesc='A Python wrapper for Discord RPC (Updated 5.5)'
arch=('any')
url='https://pypi.org/project/discord-rpc/'
license=('MIT')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')

source=("https://files.pythonhosted.org/packages/source/d/discord-rpc/${_name}-${pkgver}.tar.gz")
sha256sums=('47c04478bd656f32a1f7d5189dcb85d8b25740bb0967264b97e84cc4b89e89a5')

build() {
    cd "${_name}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_name}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    
    # Установка лицензии из корня папки сборки
    install -Dm644 "$startdir/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
