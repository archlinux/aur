# Maintainer: ple <ple21108@gmail.com>
# Contributor: Atte Virtanen <aten.email@gmail.com>
pkgname=vrk-mpollux-digisign-client
pkgver=4.3.2_8863
pkgrel=1
epoch=4
pkgdesc="Client program for Finnish chip ID cards"
arch=('x86_64')
url="https://dvv.fi/linux-versiot"
license=('custom')
depends=('pcsclite' 'qt5-base' 'nss')
install=vrk-mpollux-digisign-client.install

_eevertti_id='235111673'
source_x86_64=($pkgname-$pkgver.deb::"https://dvv.fi/documents/16079645/$_eevertti_id/mpollux-digisign-client-for-dvv_${pkgver//_/-}_amd64.deb")

sha256sums_x86_64=('7d035aac3f5001b0266e2b43de4c54c49302a409b7507d5d1d72a2b5f11eca1b')

backup=('etc/xdg/autostart/mpollux-digisign-client.desktop'
        'etc/xdg/Fujitsu/CCryptoLib.conf')

package() {
        tar xvfJ data.tar.xz -C "$pkgdir/"

        rmdir "$pkgdir/usr/sbin"
        mv "$pkgdir/usr/lib64" "$pkgdir/usr/lib"
        install -D "$pkgdir/usr/share/doc/mpollux-digisign-client-for-dvv/copyright" "$pkgdir/usr/share/licenses/$pkgname/copyright"
        mv "$pkgdir/usr/share/doc/mpollux-digisign-client-for-dvv" "$pkgdir/usr/share/doc/$pkgname"
}
