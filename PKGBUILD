# Maintainer: Phusit Somboonyingsuk

pkgname=mprisence
pkgver=0.3.2
pkgrel=1
pkgdesc="A Discord Rich Presence client for MPRIS-compatible media players with support for album art."
url="https://github.com/pullinglazy/mprisence"
license=("MIT")
arch=("x86_64")
provides=("mprisence")
conflicts=("mprisence")
source=("https://github.com/pullinglazy/mprisence/releases/download/v$pkgver/mprisence-$pkgver-x86_64.tar.gz" "https://raw.githubusercontent.com/pullinglazy/mprisence/main/LICENSE" "https://raw.githubusercontent.com/pullinglazy/mprisence/main/systemd/mprisence.service")
sha256sums=('b6a4cb01ea5c9e855b566c4c25c18c0c5e3cc1af3ded6235f82fc9bc60c864fe'
	'2efd06eb77e15171ec8727caece105c68fcf253f57d5af76d7964c69f16fbb7d'
	'8103053db7f9850d775785db8a56461a4440220b231144899bf8da38a0f7363c')

package() {
	install -Dm755 mprisence -t "$pkgdir/usr/bin"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 mprisence.service "$pkgdir/usr/lib/systemd/user/mprisence.service"
}
