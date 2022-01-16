# Maintainer: rpkak <rpkak@users.noreply.github.com>
pkgname='local-aur'
pkgver=0.0.3
pkgrel=1
epoch=
pkgdesc="Create a local pacman repo with the packages you want to use."
arch=('any')
url="https://github.com/rpkak/local-aur"
license=('Apache')
groups=()
depends=('pacman' 'git' 'python3' 'sudo' $(pacman -Sgq base-devel))
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
sha256sums=('22f0d1bbefcf5350527ad789d70b57d1bf91b0f6c909af7ca67e7cea92acd2e0')
validpgpkeys=()

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 ./local-aur "$pkgdir/usr/bin/local-aur"
	install -Dm644 ./pacman-config "$pkgdir/usr/share/local-aur/pacman-config"
	mkdir -p "$pkgdir/var/lib/$pkgname/repo"
	echo '{"packages": {}}' > "$pkgdir/var/lib/$pkgname/local-aur.json"
}
