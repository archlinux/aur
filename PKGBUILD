# Maintainer: Evan Anderson <evananderson@thelinuxman.us>
pkgname=authbind
pkgver=2.1.2
pkgrel=1
pkgdesc="Allows non-root programs to bind() to low TCP ports (0-1023)"
arch=('i686' 'x86_64')
url="http://packages.qa.debian.org/a/authbind.html"
license=('GPL')
depends=('glibc')
source=(http://ftp.debian.org/debian/pool/main/a/${pkgname}/${pkgname}_${pkgver}.tar.gz)
md5sums=('e301e83e9683abc3aebf08ebdfe58041')

build() {
    cd "$srcdir/$pkgname"
    make prefix=/usr
}

package() {
    cd "$srcdir/$pkgname"
    mkdir -p "$pkgdir/usr/bin" "$pkgdir/usr/share/man/man1"
    make prefix="$pkgdir/usr" etc_dir="$pkgdir/etc/authbind" install install_man
}
