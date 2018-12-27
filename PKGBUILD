# Maintainer: Hyacinthe Cartiaux <hyacinthe.cartiaux@free.fr>
# Contributor: Earnest <zibeon@gmail.com>
# Contributor: Eugeni Dodonov <eugeni@dodonov.net>
# Contributor: Tom Vincent <aur@tlvince.com>
pkgname=powerstat-git
pkgver=0.02.18.r1.g6b25c64
pkgrel=1

pkgdesc='A tool for measuring a laptops power usage via the battery.'
arch=('i686' 'x86_64')
url="http://kernel.ubuntu.com/~cking/powerstat/"
license=('GPL2')

depends=('glibc')
makedepends=('git')

provides=('powerstat')
conflicts=('powerstat')

source=('git://kernel.ubuntu.com/cking/powerstat.git')

md5sums=('SKIP')

pkgver() {
    cd "${srcdir}/powerstat"
    git describe --long --tags | sed 's/^V//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "${srcdir}/powerstat"
    make
}

package() {
    cd "${srcdir}/powerstat"
    make DESTDIR="$pkgdir" install
}
