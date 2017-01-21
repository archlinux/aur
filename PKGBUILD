# Maintainer: mathieui <mathieui[at]mathieui.net>

pkgname=poezio
pkgrel=2
pkgver=0.10
pkgdesc="A full-featured command-line irc-like xmpp (jabber) client"
arch=('i686' 'x86_64')
url="http://poez.io"
license=('zlib')
depends=('python>=3.4' 'python-slixmpp')
makedepends=('python-setuptools')
source=("https://pypi.python.org/packages/a8/87/233467ce8d945498d12782a175a5bc1bed595633a796accc41a4aa583624/poezio-0.10.tar.gz")
optdepends=('python-pyinotify: Autoaway with screen plugin'
            'gnupg: GPG plugin'
            'figlet: ASCII art plugin'
            'pure-python-otr-git: OTR plugin'
            'python-sphinx: Generating documentation')

sha512sums=('f4a8a1a5ed4e88d76bf596c55d91d8b20246e4d328e905ed51e8954ddafd583210e3be2cece76871d61631637e082b2df848bfc358e911a50d9c444e6c47110f')

build() {
    cd $srcdir/$pkgname-$pkgver
    python3 setup.py build_ext --inplace
}

package() {
    cd $srcdir/$pkgname-$pkgver
    python3 setup.py install --root="$pkgdir/" --optimize=1
}
