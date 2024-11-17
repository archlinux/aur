# Maintainer: envolution
# Contributor: Evan Anderson <evananderson@thelinuxman.us>
pkgname=authbind
pkgver=2.2.0
pkgrel=1
pkgdesc="Allows non-root programs to bind() to low TCP ports (0-1023)"
arch=('i686' 'x86_64')
url="http://packages.qa.debian.org/a/authbind.html"
license=('GPL')
depends=('glibc')
source=(http://ftp.debian.org/debian/pool/main/a/${pkgname}/${pkgname}_${pkgver}.tar.gz)
md5sums=('53a5755597388509a26602b7d2df711d')

build() {
    cd "work"
    make prefix=/usr
}

package() {
    cd "work"
    mkdir -p "$pkgdir/usr/bin" "$pkgdir/usr/share/man/man1"
    make prefix="$pkgdir/usr" etc_dir="$pkgdir/etc/authbind" install install_man
}
