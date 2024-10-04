# Maintainer: <https://aur.archlinux.org/account/zeauw>

_name=ligotimegps
pkgname=python-${_name}
pkgver=2.0.1
pkgrel=1
pkgdesc="Pure-python implementation of lal.LIGOTimeGPS"
arch=('any')
url='https://github.com/gwpy/ligotimegps'
license=('GPLv3')
depends=('python')
makedepends=('python-wheel' 'python-installer')
source=("${_name//-/_}-${pkgver}-py2.py3-none-any.whl::https://files.pythonhosted.org/packages/py2.py3/${_name::1}/${_name}/${_name//-/_}-${pkgver}-py2.py3-none-any.whl" "LICENSE")
sha256sums=('da8c1289ba1310337ef5177e7936e25ce47d4e8e6a269cbdd5e9abfc5b5db490'
    '8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903')

build() {
    wait
}

package() {
    python -m installer --destdir="$pkgdir" *.whl
    install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
