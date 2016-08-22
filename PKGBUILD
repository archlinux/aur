# Maintainer: Karol Babioch <karol@babioch.de

pkgname=otca-git
pkgver=1.r2.1dd2522
pkgrel=2
pkgdesc="otca is a script supporting you in quickly setting up a simple public-key infrastructure."
arch=('any')
url="https://github.com/kbabioch/otca/"
license=('GPL3')
depends=('openssl')
makedepends=('git')
provides=('otca')
conflicts=('otca')
backup=('etc/otca/otca.cnf')
source=('git+https://github.com/kbabioch/otca.git')
sha256sums=('SKIP')

pkgver() {

    cd "$srcdir/otca"
    git describe --long | sed 's/^v//;s/\([^-]*-\)g/r\1/;s/-/./g'

}

build() {

    #make
    :

}

package() {

    cd "$srcdir/otca"
    make DESTDIR="$pkgdir/" install

}

