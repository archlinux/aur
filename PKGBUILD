# Maintainer: Kenneth Flak <kennethflak@protonmail.com>

pkgname=touchosc-bin
pkgver=1.0.0.92
pkgrel=1
pkgdesc='Modular control surface'
arch=('x86_64')
url=http://hexler.net
license=(custom:TouchOSC)
source=("https://hexler.net/pub/touchosc/touchosc-$pkgver-linux-$arch.deb")
sha256sums=('83469ec3aa776954d2eee2a52d58dab061593aab8605f99cf35b851fe0d4e6ef')

package() {

    cd "$srcdir"

    ar vx "touchosc-$pkgver-linux-$arch.deb"
    tar xzvf data.tar.gz

    sed -i 's:opt/touchosc:usr/bin:g' usr/share/applications/touchosc.desktop

    install -Dm755 $srcdir/opt/touchosc/TouchOSC $pkgdir/usr/bin/TouchOSC
    install -Dm755 $srcdir/usr/share/applications/touchosc.desktop $pkgdir/usr/share/applications/touchosc.desktop

}
