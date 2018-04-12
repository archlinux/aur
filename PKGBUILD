# Maintainer: svdev <sergio at svcdev dot com>

pkgname=dexbot
pkgver=0.1.12.r2.g871137e
pkgrel=1
pkgdesc="Trading bot for the DEX (BitShares)"
arch=(any)
url="https://dexbot.info"
license=("MIT")
depends=('python>=3' 'python-setuptools' 'python-pip')
makedepends=('git')
source=("git+git://github.com/svdev/dexbot.git")
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/dexbot"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$srcdir/dexbot"
    python3 -m pip install -r requirements.txt
    python3 setup.py build
}

package() {
    cd "$srcdir/dexbot"
    python3 setup.py install --user
}

