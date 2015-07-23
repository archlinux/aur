# Maintainer: lykaner <grayfox@outerhaven.de>
# Contributor: lykaner <grayfox@outerhaven.de>
pkgname=keepassc
pkgver=1.7.0
pkgrel=1
pkgdesc="KeePassC is a curses-based password manager compatible to KeePass v.1.x and KeePassX"
arch=(any)
url="https://raymontag.github.com/keepassc"
license=('GPL')
depends=('python-kppy>=1.4.0' 'python>=3.3')
optdepends=('xsel: copy usernames and password to clipboard'
            'openssl: to create server certificates')
source=(https://pypi.python.org/packages/source/k/keepassc/keepassc-$pkgver.tar.gz)
provides=('keepassc')
conflicts=('keepassc-git' 'keepassc-dev')
md5sums=('ee602ba69763b0eb2a9bde9fa3491b2b')

build() {
    cd $srcdir/keepassc-$pkgver
    python setup.py build
}

package() {
    cd $srcdir/keepassc-$pkgver
    python setup.py install --root="$pkgdir/" --optimize=1
}

