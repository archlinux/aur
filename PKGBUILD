# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
_pkgname=pyqcc
pkgname=python-${_pkgname}
pkgver=0.1.5
pkgrel=1
pkgdesc="Python package to communicate with Crypta Labs QRNG devices"
arch=(any)
url=https://cryptalabs.com/qrng-driver-downloads/
license=(LicenseRef-unknown)
depends=(
    python
    python-pyserial
    qcc
)
makedepends=(python-installer)
source=(
    https://cryptalabs.com/support/releases/pyqcc/$_pkgname-$pkgver-py3-none-$arch.whl
    license-unknown.txt
)
b2sums=('2496e17ebcd4f5ed1b30411e6b1aaeeef851366c9179c60a03c4268bed20c40ec49914f6528bc4a61cfb274a6a071f552904f64aef9b443b2b56263aec1c634c'
        '900dfce730c0f29b0cd5fafdf5ed6bc08a3ca245c3bbee12878c7e183951e0a55e33205da747d1666baded6133473fa8506dea252a2bc23f6f7555ebfa500d54')

package() {
    python -m installer --destdir="$pkgdir" *.whl
    install -D -m0644 license-unknown.txt "$pkgdir"/usr/share/licenses/$pkgname/license-unknown.txt
}
