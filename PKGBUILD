# Maintainer: Manuel Hüsers <aur@huesers.de>
# Contributor: Brad Erhart <tocusso underscore malty at aleeas dot com>

pkgname='gvisor-bin'
_pkgbin='runsc'
_pkgshim='containerd-shim-runsc-v1'
pkgver=20221205.0
pkgrel=1
pkgdesc='OCI container sandbox runtime focused on security, efficiency, and ease of use'
arch=('x86_64' 'aarch64')
url='https://gvisor.dev'
license=('Apache')
optdepends=('docker: for Docker runtime support')
provides=(
	"${pkgname%-bin}"
)
conflicts=(
	"${pkgname%-bin}"
)
source_x86_64=(
	"$_pkgbin-x86_64-$pkgver::https://storage.googleapis.com/${pkgname%-bin}/releases/release/$pkgver/x86_64/$_pkgbin"
	"$_pkgshim-x86_64-$pkgver::https://storage.googleapis.com/${pkgname%-bin}/releases/release/$pkgver/x86_64/$_pkgshim"
)
source_aarch64=(
	"$_pkgbin-aarch64-$pkgver::https://storage.googleapis.com/${pkgname%-bin}/releases/release/$pkgver/aarch64/$_pkgbin"
	"$_pkgshim-aarch64-$pkgver::https://storage.googleapis.com/${pkgname%-bin}/releases/release/$pkgver/aarch64/$_pkgshim"
)
sha512sums_x86_64=('71cc1902409048437c71755c51a351d986c6280dd2872961efd87beebf96a00b87013bc02697594f33053e376a8f17bbb24e67682ae48769a24a23d2d5555aaa'
                   '03c8ae69c35d54296ed5064d8d7769a984a9b82b82e2edbdee4186d07cb363cb0db8c704458909a989f947ebbaa2da04f204277351d227868f4a2deedf3b4965')
sha512sums_aarch64=('186a4efd729b956e06ff19666b0dbbcc4b71ef9edba57a1f68db627c8d60eab2725be2d4814e62e4ba2950d8a783f479c259c7af5d81121fdc7fcd6f4d59efc8'
                    '9a9b9be295a3bbf123f7738ea3a805505098eed2966f074344e81a62691e05bc2c4264000adb2e7460e3813f8b45d573eb0863d41d0a2729c2a62bc7610be59e')

package() {
	install -Dm 755 "$_pkgbin-$CARCH-$pkgver" "$pkgdir/usr/bin/$_pkgbin"
	install -Dm 755 "$_pkgshim-$CARCH-$pkgver" "$pkgdir/usr/bin/$_pkgshim"
}
