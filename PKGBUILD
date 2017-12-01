####
# Maintainer: Kamil Cukrowski <kamilcukrowski@gmail.com>

pkgbase=
pkgname=cukrowski.kamil-scripts
pkgver=0.3.3
pkgrel=3
epoch=
pkgdesc='These are Kamil Cukrowski private/public scripts. Do not use.'
arch=('any')
url="https://github.com/Kamilcuk/${pkgname##*.}"
license=('MIT' 'custom:Beerware')
groups=()
depends=(pacutils)
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=(etc/bash_completion.d/kamil-scripts.sh etc/rc-local/01-example-script)
options=()
install=""
changelog=
source=("${pkgname##*.}::git+${url}.git")
noextract=()
md5sums=('SKIP')
validpgpkeys=()

pkgver() {
	cd "$pkgname"
	git describe --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}
package() {
	cp -a "$pkgname"/resources/* "$pkgdir"
	chown -R root:root "$pkgdir"
}
