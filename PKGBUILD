# Maintainer: qwjyh <urataw421 at gmail dot com>

pkgname=python-opcua-client
_name=${pkgname#python-}
pkgver=1.0.2
pkgrel=1
pkgdesc="OPC-UA Client GUI"
depends=('python' 'python-pyqt5' 'python-numpy' 'python-opcua-asyncio')
optdepends=('python-pyqtgraph: graph rendering')
makedepends=('gendesk')
arch=('any')
url="https://github.com/FreeOpcUa/opcua-client-gui"
license=('GPL-3.0-only')
source=("https://files.pythonhosted.org/packages/py3/${_name::1}/$_name/${_name//-/_}-$pkgver-py3-none-any.whl"
        "$_name.desktop")
sha256sums=('e6508a60c14cc0673bf7c82700d017b9e0a0931c0466fe48a1e60aaff4aa43d9'
            '78286ed6e5802b038574a7d42801985873fbe62c7f6b4d8ce51a763b686398e9')


package() {
    python -m installer --destdir="$pkgdir" "${_name//-/_}-$pkgver-py3-none-any.whl"

    install -Dm644 "$_name.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
}
