# Maintainer: mathieui <mathieui[at]mathieui.net>

pkgname=poezio
pkgrel=1
pkgver=0.11
pkgdesc="A full-featured command-line irc-like xmpp (jabber) client"
arch=('i686' 'x86_64' 'armv7h')
url="https://poez.io"
license=('zlib')
depends=('python>=3.4' 'python-slixmpp>=1.2.4')
makedepends=('python-setuptools')
source=("https://dev.louiz.org/attachments/download/118/${pkgname}-${pkgver}.tar.gz")
optdepends=('python-pyinotify: Autoaway with screen plugin'
            'gnupg: GPG plugin'
            'figlet: ASCII art plugin'
            'pure-python-otr-git: OTR plugin'
            'python-sphinx: Generating documentation')

sha512sums=('1df750f889c898ea3f463cf9de405d47b53f8d6ef9c75cdc6a8d5279ea4115033a431ff20525601603e1eea0e59355971b400fb5de2bc20df491003928a7064d')

build() {
    cd $srcdir/$pkgname-$pkgver
    python3 setup.py build_ext --inplace
}

package() {
    cd $srcdir/$pkgname-$pkgver
    python3 setup.py install --root="$pkgdir/" --optimize=1
}
