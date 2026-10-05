
# Maintainer: Sean Snell <ssnell@lakecs.net>

pkgname=python-visca-over-ip
gitname="VISCA-IP-Controller"
pkgver=0.5.2
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
sha512sums=('2fe065501ef960dd9b07fa859a0bf32194885a8f8a4be295a647dec0f5b6b5c8e30144470ce8feec232d985f12a9e94c821a706baf4a8f6d7ce59eb5a0ed2435')

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
