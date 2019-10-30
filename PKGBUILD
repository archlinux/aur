# Maintainer: Peter Dean <pjd2503 at gmail dot com>
pkgname='plod'
pkgver=1.9
pkgrel=1
pkgdesc="tool for keeping an on-line journal of what you're working on"
arch=('any')
url="http://deer-run.com/~hal/plod/"
license=('Perl')
depends=('perl' 'crypt')
source=("http://deer-run.com/~hal/plod/plod.shar")
md5sums=('2f1b52298eed7b660eb4a73c3a2cba83')

prepare() {
    cd $srcdir
    sh plod.shar
    sed -i 's,/local,,;s,/bin/crypt,/usr/bin/crypt,;s/emacs/vim/' plod
}

package() {
    cd $srcdir
    install -Dm644 ./README $pkgdir/usr/share/doc/plod/README
    install -Dm644 ./TODO $pkgdir/usr/share/doc/plod/TODO
    install -Dm644 ./plod.el.* $pkgdir/usr/share/doc/plod/
    install -Dm644 ./plod.man $pkgdir/usr/share/man/man1/plod.1
    install -Dm755 ./plod $pkgdir/usr/bin/plod
}

