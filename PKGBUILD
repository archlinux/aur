# Contributor: Hyacinthe Cartiaux <hyacinthe.cartiaux@free.fr>
# Contributor: Earnest <zibeon@gmail.com>
# Contributor: Eugeni Dodonov <eugeni@dodonov.net>
# Contributor: Tom Vincent <aur@tlvince.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=powerstat-git
pkgver=0.02.27.r2.g72056da
pkgrel=1
pkgdesc='A tool for measuring a laptops power usage via the battery.'
arch=('i686' 'x86_64')
url="https://github.com/ColinIanKing/powerstat"
license=('GPL2')
depends=('glibc')
makedepends=('git')
provides=('powerstat')
conflicts=('powerstat')
source=("git+$url.git")
md5sums=('SKIP')

pkgver() {
    cd powerstat
    git describe --long --tags | sed 's/^V//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd powerstat
    make
}

package() {
    cd powerstat
    make DESTDIR="$pkgdir" install
}
