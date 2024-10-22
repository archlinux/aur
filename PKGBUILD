
# Maintainer: Sean Snell <ssnell@lakecs.net>

pkgname=python-visca-over-ip
gitname="VISCA-IP-Controller"
pkgver=0.5.0
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
sha512sums=('0fa84bcd14d4a52daf4e2b70cc59776e58f54d737fa94eba915e2c38fb0f7ef7953e8d2380febe9f80812b0dd7a4ae6ca2c7bdfb6568c781fca9caa4d68073b9')
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