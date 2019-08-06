# Maintainer: Étienne Deparis <etienne@depar.is>

pkgname=no-more-secrets
pkgver=0.3.3
pkgrel=1
pkgdesc="A command line tool that recreates the famous data decryption effect seen in the 1992 movie Sneakers."
url="https://github.com/bartobri/no-more-secrets"
arch=('i686' 'x86_64')
license=('GPL3')
source=("https://github.com/bartobri/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('cfcf408768c6b335780e46a84fbc121a649c4b87e0564fc972270e96630efdce')
conflicts=("no-more-secrets-git")

build() {
    cd $pkgname-$pkgver
    make all
}

package() {
    cd $pkgname-$pkgver
    make install DESTDIR=$pkgdir prefix=/usr

    install -D -m644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
    install -D -m644 README.md $pkgdir/usr/share/doc/$pkgname/README.md
    install -D -m644 NCURSES.md $pkgdir/usr/share/doc/$pkgname/NCURSES.md
}
