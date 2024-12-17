
# Maintainer: Sean Snell <ssnell@lakecs.net>

pkgname=python-visca-over-ip
gitname="VISCA-IP-Controller"
pkgver=0.5.1
pkgrel=1
pkgdesc="Python code for controlling PTZ cameras using VISCA commands over a local network."
arch=('any')
url="https://github.com/misterhay/VISCA-IP-Controller/"
license=('Custom')
makedepends=('git' 'python-setuptools')
provides=('python-visca-over-ip')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/misterhay/${gitname}/archive/refs/tags/v${pkgver}.tar.gz")
# source=("${gitname}"::git+https://github.com/misterhay/VISCA-IP-Controller.git#commit=d2ef661)

#Upstream tar.gz
sha512sums=('08870a85d6786d0f8984d41b488740d66544535dde528da97c38f776367a78bff6eecd8e8b6fde641bafdb8fb1966a24a525073ab8b7925e7dbf82ccfe82c14a')
#sha512sums=('SKIP')

build() {
    cd "$gitname-$pkgver"
    #cd "$srcdir/$gitname"
    python setup.py build
}

package() {
    cd "$gitname-$pkgver"
    # cd "$srcdir/$gitname"
    python setup.py install --root="$pkgdir" --optimize=1
    install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}