# Maintainer: Eric Langlois <eric@langlois.xyz>
pkgname=duplicacy-web
pkgver=1.4.1
pkgrel=1
pkgdesc="Cross-platform cloud backup tool with a web GUI"
arch=('x86_64' 'arm')
url="https://duplicacy.com/"
license=('custom')
depends=()
makedepends=()
source=("$pkgname@.service"
        "$pkgname.service"
        "LICENSE")
source_x86_64=("$pkgname::https://acrosync.com/$pkgname/${pkgname//-/_}_linux_x64_$pkgver")
source_arm=("$pkgname::https://acrosync.com/$pkgname/${pkgname//-/_}_linux_arm_$pkgver")
sha256sums=('f169ca1196a3d99661b5fdf9b61d18c3f7a1341f6d90c1411874a9ebfecce10a'
            '33325dd4c621676af89c4f6c27105fb16e0b9b00e962e6496f7d532f907646bf'
            'f6da608f2babc6db66aed83e0ba7e1ce130680b15d2dbe01019cb01c88abc7db')
sha256sums_x86_64=('c6e310ef2b538105b55fbe9daa18aef6c2219dce3da4cbf2cf68a16124b783fd')
sha256sums_arm=('fa5d50b453ac65e44a8778b06fbe46bf83ba6d425975d915f83d88591e581d74')

package() {
	install -m755 -D -t "$pkgdir/usr/bin" "$pkgname"
	install -m644 -D -t "$pkgdir/usr/lib/systemd/system" "$pkgname@.service"
	install -m644 -D -t "$pkgdir/usr/lib/systemd/user" "$pkgname.service"
	install -m644 -D -t "$pkgdir/usr/share/licenses/$pkgname" "LICENSE"
}
