# Maintainer: JohnChiao <johnchiao@outlook.com>
pkgname=aurora-ltr
pkgver=0.1.0
pkgrel=1
pkgdesc="Lightweight CLI for maintaining AUR packages"
arch=('any')
url="https://github.com/JohnChiao75/aurora"
license=('MIT')
depends=('python' 'git' 'pacman')
makedepends=()
optdepends=(
  'base-devel'
  'paru'
  'yay'
  'sudo'
)
# aurutils 也提供 /usr/bin/aur，两者装一起会文件冲突
conflicts=('aurutils')
backup=()
options=('!strip')
source=("AURora-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')

package() {
	cd "AURora-$pkgver"

	install -Dm755 main.py "$pkgdir/usr/bin/aurora"
	ln -s aurora "$pkgdir/usr/bin/aur"

	install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"

}
