# Maintainer: Lev Lybin <lev.lybin@gmail.com>
# Contributor: Lev Lybin <lev.lybin@gmail.com>

pkgname=btdex
pkgver=0.1.21
pkgrel=2
pkgdesc='Decentralized exchange system running on the Burst blockchain'
arch=(x86_64)
url='https://github.com/btdex/btdex'
license=(GPL3)
options=(!strip)
depends=(java-environment xdg-utils)
conflicts=(btdex-git)
provides=(btdex-git)
install=btdex.install
source=(https://github.com/btdex/btdex/releases/download/v$pkgver/btdex-all-v$pkgver.jar
        https://raw.githubusercontent.com/btdex/btdex/v$pkgver/dist/btdex.ico
        https://raw.githubusercontent.com/btdex/btdex/v$pkgver/dist/btdex.sh
        https://raw.githubusercontent.com/btdex/btdex/v$pkgver/dist/btdex.desktop)
sha256sums=('e710dc7f77917d8a3e10172acb619529dff5c319e5ac374fc60c586a4fec8be5'
            '18e0fa60623d1886743f8dab10350b6ab5bba9eb0bb1eef7be6991369a4af3f2'
            '3c1830a574257a35e4d4e1a242f786b98fb3fa0d3c7db1418d4b69d4df881533'
            'fa8e5f6561192d1f2554365a7f49c36ac368ae00413f489c0873a801c11e6219')

package() {
    cd $srcdir

    install -d $pkgdir/opt/$pkgname
    install -Dm644 btdex-all-v$pkgver.jar $pkgdir/opt/$pkgname/btdex-all.jar
    install -Dm755 btdex.sh $pkgdir/opt/$pkgname/btdex.sh
    install -d $pkgdir/usr/bin
    ln -sf /opt/$pkgname/btdex.sh $pkgdir/usr/bin/btdex

    # Menu entry
    install -Dm644 $pkgname.desktop -t $pkgdir/usr/share/applications
    install -Dm644 btdex.ico $pkgdir/usr/share/pixmaps/$pkgname.ico
}
