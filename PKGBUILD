# Maintainer: ple <ple21108@gmail.com>
# Contributor: Atte Virtanen <aten.email@gmail.com>
pkgname=vrk-mpollux-digisign-client
pkgver=4.2.6_8401
pkgrel=1
epoch=3
pkgdesc="Client program for Finnish chip ID cards"
arch=('x86_64')
url="https://dvv.fi/linux-versiot"
license=('custom')
depends=('pcsclite' 'qt5-base' 'nss')
install=vrk-mpollux-digisign-client.install

_eevertti_id='165492525'
source_x86_64=($pkgname-$pkgver.deb::"https://dvv.fi/documents/16079645/$_eevertti_id/mpollux-digisign-client-for-dvv_${pkgver//_/-}_amd64.deb")

sha256sums_x86_64=('5ef54dccf736e9268270720089a0b1334192a210f69bd48488e55b71fe21b72f')

backup=('etc/xdg/autostart/mpollux-digisign-client.desktop'
        'etc/xdg/Fujitsu/CCryptoLib.conf')

package() {
        tar xvfJ data.tar.xz -C "$pkgdir/"

        rmdir "$pkgdir/usr/sbin"
        mv "$pkgdir/usr/lib64" "$pkgdir/usr/lib"
        install -D "$pkgdir/usr/share/doc/mpollux-digisign-client-for-dvv/copyright" "$pkgdir/usr/share/licenses/$pkgname/copyright"
        mv "$pkgdir/usr/share/doc/mpollux-digisign-client-for-dvv" "$pkgdir/usr/share/doc/$pkgname"
}
