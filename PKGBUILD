# Maintainer: mathieui <mathieui[at]mathieui.net>

pkgname=poezio
pkgrel=1
pkgver=0.8.1
pkgdesc="A full-featured command-line irc-like xmpp (jabber) client"
arch=('i686' 'x86_64')
url="http://poez.io"
license=('zlib')
depends=('python' 'python-sleekxmpp' 'python-dnspython')
makedepends=('setuptools')
source=("http://dev.louiz.org/attachments/download/52/$pkgname-$pkgver.tar.xz")
optdepends=('python-pyinotify: Autoaway with screen plugin'
            'gnupg: GPG plugin'
            'figlet: ASCII art plugin'
            'pure-python-otr-git: OTR plugin'
            'python-sphinx: Generating documentation')

sha512sums=('b9ca0c9ef5474180962f1c8ff2d2f5d6d5edbfdeefa5a0470e5d597d4122cf625060e270765c0f0a30e0b9f626b24edfbb135cfe66d1502aef27b6ee9996905c')

build() {
    cd $srcdir/$pkgname-$pkgver
    make DESTDIR=$pkgdir prefix=/usr
}

package() {
    cd $srcdir/$pkgname-$pkgver
    make DESTDIR=$pkgdir prefix=/usr install
}
