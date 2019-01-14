# Maintainer: H. Rosendahl <h (at) ro (dot) sendahl (dot) de>
pkgname="mate-i3-applet"
pkgver=2.3.0
pkgrel=1
pkgdesc="i3 workspace applet for MATE"
arch=("any")
url="https://github.com/city41/mate-i3-applet"
license=("BSD")
depends=("python")
source=("${url}/archive/${pkgver}.tar.gz")
sha512sums=('ca6dca7c0f38c4f809eebd3bf8245dc9f6e8e3a07160378ed1928dce144099c7fdbf5b7857401b2cde8464e1640ec01995025af3f1cd5f2e1745d94c64585dd2')

build() {
    cd "$srcdir/${pkgname}-${pkgver}"
    python setup.py build
}

package() {
    cd "$srcdir/${pkgname}-${pkgver}"
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
    install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim: noai:ts=4:sw=4:expandtab
