# Maintainer: rpkak <rpkak@users.noreply.github.com>
pkgname='local-aur'
pkgver=0.0.2
pkgrel=1
epoch=
pkgdesc="Create a local pacman repo with the packages you want to use."
arch=('any')
url="https://github.com/rpkak/local-aur"
license=('Apache')
groups=()
depends=('pacman' 'git' 'python' 'sudo')
makedepends=('pacman')
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
sha256sums=('35d4d6b8c4c567a9d44e50903a210db779f181518c8e41e5ff4263fe7d361dd9')
validpgpkeys=()

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 ./local-aur "$pkgdir/usr/bin/local-aur"
	mkdir -p "$pkgdir/var/lib/$pkgname/repo"
	echo '{"packages": {}}' > "$pkgdir/var/lib/$pkgname/local-aur.json"
	repo-add "$pkgdir/var/lib/$pkgname/repo/local-aur.db.tar.gz"
}
