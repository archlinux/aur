# Submitter: Kuan-Yen Chou <forendef2846@gmail.com>

pkgname=onos
pkgver=1.15.0
pkgrel=1
pkgdesc='Open Network Operating System'
arch=('any')
url='https://onosproject.org'
license=('Apache')
depends=('jdk8-openjdk' 'curl')
install=onos.install
source=("https://repo1.maven.org/maven2/org/onosproject/onos-releases/${pkgver}/${pkgname}-${pkgver}.tar.gz"
        "onos.service")
sha256sums=('3bba44078745c8f6382ea00f898d2df8bc4edff717ab73415ad2ffc7c15c9031'
            '4837f3e924c5806a0095f013099e2f8c959389d1c3c57820c512cfe7d2e14fbd')

package() {
    mkdir -p "$pkgdir/opt"
    mv "$srcdir/$pkgname-$pkgver" "$pkgdir/opt/$pkgname"
    install -Dm 644 "$srcdir/onos.service" -t "$pkgdir/usr/lib/systemd/system"
}

# vim: set ts=4 sw=4 et:
