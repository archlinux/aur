# Maintainer: mathieui <mathieui[at]mathieui.net>
# Maintainer: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>

pkgname=poezio
pkgver=0.11
pkgrel=3
pkgdesc="A full-featured command-line IRC-like XMPP (Jabber) client"
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url="https://poez.io"
license=('zlib')
depends=('python' 'python-slixmpp')
makedepends=('python-setuptools')
source=("https://dev.louiz.org/attachments/download/118/${pkgname}-${pkgver}.tar.gz")
optdepends=('python-pyinotify: Autoaway with screen plugin'
            'gnupg: GPG plugin'
            'figlet: ASCII art plugin'
            'python-potr-git: OTR plugin'
            'python-sphinx: Generating documentation')

sha512sums=('1df750f889c898ea3f463cf9de405d47b53f8d6ef9c75cdc6a8d5279ea4115033a431ff20525601603e1eea0e59355971b400fb5de2bc20df491003928a7064d')

build() {
    cd $pkgname-$pkgver
    python3 setup.py build
}

package() {
    cd $pkgname-$pkgver
    python3 setup.py install --skip-build --root="$pkgdir/" --optimize=1
}
