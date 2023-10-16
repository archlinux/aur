# Maintainer: mathieui <mathieui[at]mathieui.net>
# Maintainer: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>

pkgname=poezio
pkgver=0.14
pkgrel=1
pkgdesc="A full-featured command-line IRC-like XMPP (Jabber) client"
arch=('x86_64' 'armv7h' 'aarch64')
url="https://poez.io"
license=('zlib')
depends=('python' 'python-slixmpp')
makedepends=('python-setuptools' 'python-sphinx')
source=("https://codeberg.org/poezio/poezio/archive/v${pkgver}.tar.gz")
optdepends=('poezio-omemo: OMEMO plugin'
            'python-potr-git: OTR plugin'
            'python-pyinotify: Autoaway with screen plugin (also works with tmux)'
            'figlet: ASCII art plugin')

sha256sums=('8aefdb226c887c81f0f5758972211b173418184ecfcca7796ccfe84c363530a4')

build() {
    cd "$pkgname"
    python setup.py build
}

package() {
    cd "$pkgname"
    python setup.py install --skip-build --root="$pkgdir/" --optimize=1
}
