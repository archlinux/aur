# Maintainer: Roshless <pkg@roshless.com>

pkgname=ttea
pkgrel=2
pkgver=1.2.1
pkgdesc="Command line tea manager"
url="https://git.roshless.me/~roshless/ttea"
arch=("any")
license=("GPL")
source=("https://git.roshless.me/~roshless/$pkgname/archive/$pkgver.tar.gz")
optdepends=('mpv: play timer sound' 'mplayer: alternative player')

build() {
    cd $pkgname-$pkgver
    make PREFIX="/usr"
}

package() {
    cd $pkgname-$pkgver

    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
    make PREFIX="/usr" DESTDIR="$pkgdir" install
}

md5sums=('aaacf75cccc3eb3eeab96a4451905db4')
