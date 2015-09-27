# Maintainer: Florian Albertz <flo.albertz@gmail.com>
pkgname="archci"
pkgver="1.0.5"
pkgrel=1
pkgdesc='A script to create AppContainer Images from Arch Linux packages(Repo or Aur)'
arch=('any')
url='https://github.com/PaulAvery/archci'
license=('BSD')
depends=('bash' 'nodejs' 'pacman' 'pacaur' 'coreutils' 'rkt' 'gnupg' 'arch-install-scripts' 'sudo')
makedepends=('npm')
source=('archci.sh' 'LICENSE')
sha256sums=('SKIP' 'SKIP')

package() {
	install -Dm 755 archci.sh "$pkgdir/usr/bin/archci"
	install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/archci/BSD-3-Clause"

	# Install sjx dependency
	mkdir -p "$pkgdir/usr/lib/archci/node_modules"
	cd "$pkgdir/usr/lib/archci"
	npm install sx
}
