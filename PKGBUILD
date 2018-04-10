# Maintainer: sommd <d.j.s.1050@gmail.com>
pkgname=garlium-git
pkgver=3.0.3.1.r178.g4583027f
pkgrel=1
pkgdesc="A lightweight desktop wallet for Garlicoin, based on Electrum."
arch=('any')
url="https://xske.github.io/garlium/"
license=('MIT')
groups=()
depends=('python' 'python-dnspython' 'python-ecdsa' 'python-jsonrpclib-pelix' 'python-pbkdf2' 'python-protobuf'
    'python-pyaes' 'python-pycryptodomex' 'python-pyqt5' 'python-pysocks' 'python-qrcode' 'python-requests'
    'python-scrypt')
makedepends=('git' 'python-setuptools')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install=
source=("$pkgname::git+https://github.com/xSke/garlium")
noextract=()
md5sums=('SKIP')

pkgver() {
    cd "$pkgname"
    
    git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
    cd "$pkgname"
    python setup.py install --root="$pkgdir/" --optimize=1
    install -Dm644 LICENCE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
