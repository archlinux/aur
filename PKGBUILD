# Maintainer: mathieui <mathieui[at]mathieui.net>

pkgname=poezio
pkgrel=1
pkgver=0.9
pkgdesc="A full-featured command-line irc-like xmpp (jabber) client"
arch=('i686' 'x86_64')
url="http://poez.io"
license=('zlib')
depends=('python>=3.4' 'python-slixmpp')
makedepends=('setuptools')
source=("http://dev.louiz.org/attachments/download/91/$pkgname-$pkgver.tar.xz")
optdepends=('python-pyinotify: Autoaway with screen plugin'
            'gnupg: GPG plugin'
            'figlet: ASCII art plugin'
            'pure-python-otr-git: OTR plugin'
            'python-sphinx: Generating documentation')

sha512sums=('a6743dcd268abe2472da218b797a065936bfa52d5406275141dd5783aef2f9aba6396e3973c8a151702601a512f5f3959a7116b2171530bc7381701c6970fdfd')

build() {
    cd $srcdir/$pkgname-$pkgver
    make DESTDIR=$pkgdir prefix=/usr
}

package() {
    cd $srcdir/$pkgname-$pkgver
    make DESTDIR=$pkgdir prefix=/usr install
}
