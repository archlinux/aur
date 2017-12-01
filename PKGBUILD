####
# Maintainer: Kamil Cukrowski <kamilcukrowski@gmail.com>

pkgbase=
pkgname=cukrowski.kamil-scripts
_gitname=${pkgname##*.}
pkgver=0.3.3.r7.g839ba90
pkgrel=1
epoch=
pkgdesc='These are Kamil Cukrowski private/public scripts. Do not use.'
arch=('any')
url="https://github.com/Kamilcuk/${_gitname}"
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
source=("${_gitname}::git+${url}.git")
noextract=()
md5sums=('SKIP')
validpgpkeys=()

pkgver() {
	cd "$_gitname"
	git describe --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}
package() {
	cp -a "$_gitname"/resources/* "$pkgdir"
	chown -R root:root "$pkgdir"
}
