# Maintainer: Sabart Otto - Seberm <seberm[at]gmail[dot].com

pkgname=bash-supergenpass
_gitname=${pkgname%-git*}
pkgver=20.e5d96599b65d
pkgrel=1
pkgdesc="Bash implementation of Super Gen Pass script"
url="http://github.com/lanzz/bash-supergenpass"
arch=('any')
license=('custom')
install=
depends=('bash' 'openssl')
optdepends=()
conflicts=('perl-supergenpass')
provides=('supergenpass')
makedepends=()
source=("$_gitname::git+https://github.com/lanzz/${_gitname}.git")
sha512sums=('SKIP')

pkgver() {
    cd "$srcdir/$_gitname"
    echo $(git rev-list --count master).$(git rev-parse --short master)
}


package() {
    cd $srcdir/${_gitname}
    mkdir -p $pkgdir/usr/bin
    install -m755 supergenpass.sh $pkgdir/usr/bin/supergenpass
    chmod +x $pkgdir/usr/bin/supergenpass
}
