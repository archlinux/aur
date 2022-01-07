# Maintainer: Eric Langlois <eric@langlois.xyz>
pkgname=duplicacy-web
pkgver=1.5.0
pkgrel=1
pkgdesc="Cross-platform cloud backup tool with a web GUI"
arch=('x86_64' 'i686' 'arm' 'aarch64' 'armv7h')
url="https://duplicacy.com/"
license=('custom')
depends=()
makedepends=()
source=("$pkgname@.service"
        "$pkgname.service"
        "LICENSE")
source_x86_64=("$pkgname::https://acrosync.com/$pkgname/${pkgname//-/_}_linux_x64_$pkgver")
source_i686=("$pkgname::https://acrosync.com/$pkgname/${pkgname//-/_}_linux_i386_$pkgver")
source_arm=("$pkgname::https://acrosync.com/$pkgname/${pkgname//-/_}_linux_arm_$pkgver")
source_aarch64=("$pkgname::https://acrosync.com/$pkgname/${pkgname//-/_}_linux_arm64_$pkgver")
source_armv7h=("$pkgname::https://acrosync.com/$pkgname/${pkgname//-/_}_linux_armv7_$pkgver")
sha256sums=('f169ca1196a3d99661b5fdf9b61d18c3f7a1341f6d90c1411874a9ebfecce10a'
            '33325dd4c621676af89c4f6c27105fb16e0b9b00e962e6496f7d532f907646bf'
            'f6da608f2babc6db66aed83e0ba7e1ce130680b15d2dbe01019cb01c88abc7db')
sha256sums_x86_64=('1a28c214493c69c1a7e65dfc985e95cacda246935ca5e2541e2014cc8e2a9678')
sha256sums_i686=('cf5b6c7c1de76a848cdb452d2be9cdea29c71b4f40c59eac12046ff073edc163')
sha256sums_arm=('0aa1e18080cccb2e9adf6509eaf1cb66ae61fb618dc5c1f0225550ef74ec39f1')
sha256sums_aarch64=('9a3f3021a8959034d962d17d11ffe62ef63cd2244e87fea8f56af566f1ff1f9f')
sha256sums_armv7h=('401e4e91155bac12941069d9f13ae76ad0a87a4ad1708cfbe2eb05834b451e61')

package() {
	install -m755 -D -t "$pkgdir/usr/bin" "$pkgname"
	install -m644 -D -t "$pkgdir/usr/lib/systemd/system" "$pkgname@.service"
	install -m644 -D -t "$pkgdir/usr/lib/systemd/user" "$pkgname.service"
	install -m644 -D -t "$pkgdir/usr/share/licenses/$pkgname" "LICENSE"
}
