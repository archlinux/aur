# Maintainer: detiam <dehe_tian@outlook.com>
# Contributor: detian <dehe_detian@outlook.com>
_pkgname=nvidiap2statusworkaround
pkgname=plasma5-$_pkgname
pkgver=0.1.1
pkgrel=1
pkgdesc="A switch on your taskbar that can low down the clock speed of your Nvidia GPU, save power"
arch=(i686 x86_64)
url="https://github.com/detiam/$_pkgname"
_commit=2a178a44c3cb3759560a8838340a53a420986863
license=('GPL-2.0+')
depends=('plasma-workspace')
source=(
	"git+$url#commit=$_commit"
)
sha256sums=('SKIP')

package() {
	cd "$_pkgname"
	install -Dm644 nvidia-p2statusworkaround.service "$pkgdir/usr/lib/systemd/system/nvidia-p2statusworkaround.service"
	install -dm755 "$pkgdir/usr/share/plasma/plasmoids"
	cp -rv package "$pkgdir/usr/share/plasma/plasmoids/com.github.detiam.nvidiap2statusworkaround"
}
