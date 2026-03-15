# Maintainer: ple <ple21108@gmail.com>
# Contributor: Atte Virtanen <aten.email@gmail.com>
pkgname=vrk-mpollux-digisign-client
pkgver=4.4.0_9019
pkgrel=1
epoch=4
pkgdesc="Client program for Finnish chip ID cards"
arch=('x86_64')
url="https://dvv.fi/linux-versiot"
license=('custom')
depends=('pcsclite' 'qt5-base' 'nss')
install=vrk-mpollux-digisign-client.install

source_x86_64=($pkgname-$pkgver.deb::"https://files.fineid.fi/download/digisign/${pkgver%_*}/linux/mpollux-digisign-client-for-dvv_${pkgver//_/-}_amd64.deb")

sha256sums_x86_64=('efc4fd2ed98eb41f7ae4b2f6b75a98627e70546d53acd951e9f28cc7243eae1d')

backup=('etc/xdg/autostart/mpollux-digisign-client.desktop'
        'etc/xdg/Fujitsu/CCryptoLib.conf')

package() {
        tar xvfJ data.tar.xz -C "$pkgdir/"

        rmdir "$pkgdir/usr/sbin"
        mv "$pkgdir/usr/lib64" "$pkgdir/usr/lib"
        install -D "$pkgdir/usr/share/doc/mpollux-digisign-client-for-dvv/copyright" "$pkgdir/usr/share/licenses/$pkgname/copyright"
        mv "$pkgdir/usr/share/doc/mpollux-digisign-client-for-dvv" "$pkgdir/usr/share/doc/$pkgname"
}
