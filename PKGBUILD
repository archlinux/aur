# Maintainer: Lev Lybin <lev.lybin@gmail.com>
# Contributor: Lev Lybin <lev.lybin@gmail.com>

pkgname=btdex
pkgver=0.1.19
pkgrel=1
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
        https://github.com/btdex/btdex/raw/master/src/main/resources/icon.png
        btdex.sh
        btdex.desktop)
sha256sums=('c83b9c99e96bee092379ef28d910a7dd50cf88392164ec4bd5a7886bcf3fbf01'
            'f17dc59e7d436b4e5e577283d116599d998a88132d45d7c3e769aa21543cd9a9'
            '162e5c9fad5d5a5e5a59192a64ce6d1a5bf189465eeae4130332b3838f4d9c11'
            'd6ab59c4046cf2c3b8898c7635151e7bea726f0a914f9d353134982e56a1295f')

package() {
    cd $srcdir

    install -d $pkgdir/opt/$pkgname
    install -Dm644 btdex-all-v$pkgver.jar $pkgdir/opt/$pkgname/btdex.jar
    install -Dm755 btdex.sh $pkgdir/opt/$pkgname/btdex.sh
    install -d $pkgdir/usr/bin
    ln -sf /opt/$pkgname/btdex.sh $pkgdir/usr/bin/btdex

    # Menu entry
    install -Dm644 $pkgname.desktop -t $pkgdir/usr/share/applications
    install -Dm644 icon.png $pkgdir/usr/share/pixmaps/$pkgname.png
}
