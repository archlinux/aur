# Maintainer: qwjyh <urataw421 at gmail dot com>

pkgname=python-opcua-client
_name=${pkgname#python-}
pkgver=0.8.4
pkgrel=3
pkgdesc="OPC-UA Client GUI"
depends=('python' 'python-pyqt5' 'python-numpy' 'python-opcua-asyncio' 'python-opcua-widgets')
optdepends=('python-pyqtgraph: graph rendering')
makedepends=('gendesk')
arch=('any')
url="https://github.com/FreeOpcUa/opcua-client-gui"
license=('GPL-3.0-only')
source=("https://files.pythonhosted.org/packages/py3/${_name::1}/$_name/${_name//-/_}-$pkgver-py3-none-any.whl"
        "$_name.desktop")
sha256sums=('8ada075d24b5f4629e41f77024653ed38b1a2312c8d98fd349e91e7994ca3ae7'
            '78286ed6e5802b038574a7d42801985873fbe62c7f6b4d8ce51a763b686398e9')


package() {
    python -m installer --destdir="$pkgdir" "${_name//-/_}-$pkgver-py3-none-any.whl"

    install -Dm644 "$_name.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
}
