# Maintainer: rpkak <rpkak@users.noreply.github.com>
pkgname='local-aur'
pkgver=0.2.0
pkgrel=1
epoch=
pkgdesc="Download the AUR packages you trust and use pacman to install them."
arch=('any')
url="https://github.com/rpkak/local-aur"
license=('Apache')
groups=()
depends=('pacman' 'git' 'python3' 'tar' 'zstd' $(pacman -Sgq base-devel))
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=local-aur.install
changelog=
source=("$pkgname-$pkgver.tar.gz::https://github.com/rpkak/local-aur/archive/refs/tags/v$pkgver.tar.gz")
noextract=()
sha256sums=('836d7c05fcc8c467af8a3fe63ae60e06d98a6535ffe386d2c1149a02f7e8b8f4')
validpgpkeys=()

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 ./local-aur "$pkgdir/usr/bin/local-aur"
	install -Dm644 ./pacman-config "$pkgdir/usr/share/local-aur/pacman-config"
	install -Dm644 ./local-aur.service "$pkgdir/usr/lib/systemd/system/local-aur.service"
	install -Dm644 ./local-aur.timer "$pkgdir/usr/lib/systemd/system/local-aur.timer"
	install -Dm644 ./local-aur-sysusers.conf "$pkgdir/usr/lib/sysusers.d/local-aur.conf"
}
