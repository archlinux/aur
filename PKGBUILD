# Maintainer: Egor Kovetskiy <e.kovetskiy@office.ngs.ru>
pkgname=pam_eye
pkgver=2.6e89c90
pkgrel=1
pkgdesc="A PAM module that send hostname to gateway host"
arch=('i686' 'x86_64')
url="http://github.com/kovetskiy/pam_eye"
license=('GPL')
depends=('util-linux' 'curl')
optdepends=()
backup=()
options=()
source=("git://github.com/kovetskiy/pam_eye.git")
md5sums=('SKIP')

pkgver() {
    cd "$pkgname"
    echo $(git rev-list --count master).$(git rev-parse --short master)
}

build() {
    cd "$pkgname"
    make
}

package() {
    install -D "$pkgname/pam_eye.so" "$pkgdir/usr/lib/security/pam_eye.so"
}
