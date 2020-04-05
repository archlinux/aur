# Maintainer: Eric Langlois <eric@langlois.xyz>
pkgname=duplicacy-web
pkgver=1.2.1
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
sha256sums=(badfbf6d88480577ff3f91bfcc14e036eabd4cb04a879704294d40da02668ea9
            8e6522574d0132d3f908961cc8c4c1f592738c7372d87f9ac4463c6650955be7
            f6da608f2babc6db66aed83e0ba7e1ce130680b15d2dbe01019cb01c88abc7db)
source_x86_64=("$pkgname::https://acrosync.com/$pkgname/${pkgname//-/_}_linux_x64_$pkgver")
sha256sums_x86_64=(9381581171503788a9c31c60ea672bf0a0f3fc7d7537f83c24b318fef009b87f)
source_arm=("$pkgname::https://acrosync.com/$pkgname/${pkgname//-/_}_linux_arm_$pkgver")
sha256sums_arm=(30fd83948764f74b39be5d32b5e4d5ff97986cdaa4254ce8c6344aaf495c5597)

package() {
	install -m755 -D -t "$pkgdir/usr/bin" "$pkgname"
	install -m644 -D -t "$pkgdir/usr/lib/systemd/system" "$pkgname@.service"
	install -m644 -D -t "$pkgdir/usr/lib/systemd/user" "$pkgname.service"
	install -m644 -D -t "$pkgdir/usr/share/licenses/$pkgname" "LICENSE"
}
