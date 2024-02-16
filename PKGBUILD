
# Maintainer: Sean Snell <ssnell@lakecs.net>

pkgname=python-visca-over-ip
gitname="VISCA-IP-Controller"
pkgver=0.4.1
pkgrel=1
pkgdesc="Python code for controlling PTZ cameras using VISCA commands over a local network."
arch=('any')
url="https://github.com/misterhay/VISCA-IP-Controller/"
license=('Custom')
makedepends=('git' 'python-setuptools')
provides=('python-visca-over-ip')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/misterhay/${gitname}/archive/refs/tags/v${pkgver}.tar.gz")

# Upstream tar.gz
sha512sums=('c3f02fe151616b89d21fd59cd40e578c8c0b381762e70abc43f9169225dc1898c2765a664e6a86feb038362d8a3e178f7689496ec8d1717032df02ed006e5173')

build() {
    cd "$gitname-$pkgver"
    python setup.py build
}

package() {
    cd "$gitname-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1
    install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}