# Maintainer: Daniel Julien-Neitzert <danieljulneit@gmail.com>

pkgname=ascii-pony-git
_gitname=ASCII-Pony
pkgrel=2
pkgdesc='Shows a pony and system information'
pkgver=20220221
arch=('any')
url='https://gitlab.com/mattia.basaglia/ASCII-Pony'
source=('git+https://gitlab.com/mattia.basaglia/ASCII-Pony.git')
provides=('systempony')
license=('GPLv3+' 'CC-BY-SA 3.0')
depends=('bash' 'coreutils' 'iproute2' 'inetutils' 'procps-ng' 
         'lsb-release' 'sed' 'grep' 'findutils' 'awk' 'lxc'
	 'bc')
sha256sums=('SKIP')

package() {
	cd $_gitname
	make install PREFIX="$pkgdir/usr"
}

pkgver() {
	cd $_gitname
	git log -1 --format="%cd" --date=short | sed 's/-//g'
}
