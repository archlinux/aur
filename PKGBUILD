# Maintainer: detiam <dehe_tian@outlook.com>

pkgname=netchangexec
pkgver=0.0.1
pkgrel=1
pkgdesc="Executes command when network connection changes"
arch=(i686 x86_64)
url="https://github.com/detiam/$_pkgname"
license=('GPL-3.0')
depends=('systemd' 'awk' 'bash' 'iproute' 'grep')

source=(
	"netchangexec.sh"
	"netchangexec@.service")
sha256sums=('ff03f08b3eb7eb5eff36735c7cb47af24a8eee14ca626af864bad4578fbfc9cb'
            '6c6a3cd810341bf9aed88b7eb64923bed973eedb2d0fb09efd79d31c0981a463')

package() {
	install -dm755 "$pkgdir/usr/bin"
	install -dm755 "$pkgdir"/usr/lib/systemd/{user,system}

	install -Dm755 "$pkgname.sh" "$pkgdir/usr/bin/$pkgname"
	install -Dm644 "$pkgname@.service" "$pkgdir/usr/lib/systemd/user/"
	install -Dm644 "$pkgname@.service" "$pkgdir/usr/lib/systemd/system/"
}
