# Maintainer: ple <ple21108@gmail.com>
# Contributor: Atte Virtanen <aten.email@gmail.com>
pkgname=vrk-mpollux-digisign-client
pkgver=4.2.6b_8414
pkgrel=1
epoch=4
pkgdesc="Client program for Finnish chip ID cards"
arch=('x86_64')
url="https://dvv.fi/linux-versiot"
license=('custom')
depends=('pcsclite' 'qt5-base' 'nss')
install=vrk-mpollux-digisign-client.install

_eevertti_id='169423081'
source_x86_64=($pkgname-$pkgver.deb::"https://dvv.fi/documents/16079645/$_eevertti_id/mpollux-digisign-client-for-dvv_${pkgver//_/-}_amd64.deb")

sha256sums_x86_64=('37b211a5e68f7d0a0b5bb5b64d7a31bc17a097fa7c83bea8b9f2cb17f543c52a')

backup=('etc/xdg/autostart/mpollux-digisign-client.desktop'
        'etc/xdg/Fujitsu/CCryptoLib.conf')

package() {
        tar xvfJ data.tar.xz -C "$pkgdir/"

        rmdir "$pkgdir/usr/sbin"
        mv "$pkgdir/usr/lib64" "$pkgdir/usr/lib"
        install -D "$pkgdir/usr/share/doc/mpollux-digisign-client-for-dvv/copyright" "$pkgdir/usr/share/licenses/$pkgname/copyright"
        mv "$pkgdir/usr/share/doc/mpollux-digisign-client-for-dvv" "$pkgdir/usr/share/doc/$pkgname"
}
