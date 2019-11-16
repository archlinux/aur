# Maintainer: mathieui <mathieui[at]mathieui.net>
# Maintainer: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>

pkgname=poezio
pkgver=0.12
pkgrel=3
pkgdesc="A full-featured command-line IRC-like XMPP (Jabber) client"
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url="https://poez.io"
license=('zlib')
depends=('python' 'python-slixmpp')
makedepends=('python-setuptools')
source=("https://lab.louiz.org/poezio/poezio/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.gz")
optdepends=('python-pyinotify: Autoaway with screen plugin'
            'figlet: ASCII art plugin'
            'python-potr-git: OTR plugin'
            'python-sphinx: Generating documentation'
            'python-aiohttp: http file upload plugin')

sha256sums=('13931905b9a3ead0b624285584356b46ad79f1d62b67c2d58986877ec2d4c32c')

build() {
    cd $pkgname-v$pkgver
    python3 setup.py build
}

package() {
    cd $pkgname-v$pkgver
    python3 setup.py install --skip-build --root="$pkgdir/" --optimize=1
}
