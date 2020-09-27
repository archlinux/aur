# Maintainer: Quentin Bouvet <qbouvet at outlook dot com>
pkgname=bash-timer
pkgver=v1.1.0.r0.g35040fb
pkgrel=1
pkgdesc="Human-readable execution time for every command in bash!"
arch=('any')
url="https://github.com/hopeseekr/bash-timer"
license=('APACHE')

depends=('bash-preexec-git')
#makedepends=()
source=("$pkgname::git+https://github.com/hopeseekr/bash-timer.git")
install=$pkgname.install
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/${pkgname}"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
    cd "$srcdir/$pkgname"
    install -D -m0755 "$srcdir/$pkgname/bash-timer.sh" "$pkgdir/usr/share/bash-timer/bash-timer.sh"
}
