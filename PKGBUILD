# Maintainer: M4rQu1Nh0S <blogmrcs[AT]gmail.com
# Contributor: Nico Suarez <nicodoggie@gmail.com>
# Contributor: freaknils <nils[AT]czserver.de>
# Maintainer: M4rQu1Nh0S <blogmrcs[AT]gmail.com

pkgname=hamsket-nightly-bin
_pkgname=hamsket
pkgver=0.6.5
pkgrel=1
pkgdesc="Free, Open Source and Cross Platform messaging and emailing app that combines common web applications into one."
arch=(x86_64)
url='https://github.com/TheGoddessInari/hamsket'
license=(GPL3)
provides=(hamsket)
conflicts=(hamsket-bin)
depends=(gtk3 libnotify nss)
source=("$_pkgname.tar.gz::https://github.com/TheGoddessInari/hamsket/releases/download/nightly/$_pkgname-$pkgver.tar.gz"
        "$_pkgname.desktop"
        "$_pkgname.png")
sha256sums=('SKIP'
            '18ecd40929511a7083a690ed77690571b2160200298bf589e8818aad97317f27'
            '0bf4d0c849ad6151f77b346fea0424fab910f434378f9890b16fd15a32a10064')

package() {
    install -d $pkgdir/{opt/hamsket,usr/{bin,share/pixmaps}}

    cp -R $srcdir/hamsket-$pkgver/* $pkgdir/opt/$_pkgname/
    ln -rs $pkgdir/opt/$_pkgname/hamsket $pkgdir/usr/bin/hamsket
    chmod 4755 $pkgdir/opt/$_pkgname/chrome-sandbox

    install -Dm644 "$srcdir/$_pkgname.png" "$pkgdir/usr/share/pixmaps/$_pkgname.png"

    install -Dm644 "$srcdir/$_pkgname.desktop" -t "$pkgdir/usr/share/applications/"
}
