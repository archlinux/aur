# Maintainer: mathieui <mathieui[at]mathieui.net>
# Maintainer: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>

pkgname=poezio
pkgver=0.12
pkgrel=1
pkgdesc="A full-featured command-line IRC-like XMPP (Jabber) client"
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url="https://poez.io"
license=('zlib')
depends=('python' 'python-slixmpp')
makedepends=('python-setuptools')
source=("https://dev.louiz.org/attachments/download/129/${pkgname}-${pkgver}.tar.gz")
optdepends=('python-pyinotify: Autoaway with screen plugin'
            'gnupg: GPG plugin'
            'figlet: ASCII art plugin'
            'python-potr-git: OTR plugin'
            'python-sphinx: Generating documentation')

sha256sums=('7fdfe91109431a58152386096e367589616439ded6698ac4c48b4bdf05eac986')

build() {
    cd $pkgname-$pkgver
    python3 setup.py build
}

package() {
    cd $pkgname-$pkgver
    python3 setup.py install --skip-build --root="$pkgdir/" --optimize=1
}
