# Maintainer: Otreblan <otreblain@gmail.com>
# Contributor: Bastian Pukallus <bplinux at posteo de>

pkgname='blender-plugin-fspy'
pkgver='1.0.3'
pkgrel=3
pkgdesc="blender addon for supporting fSpy project files"
arch=('any')
url="https://github.com/stuffmatic/fSpy-Blender"
license=('GPL')
depends=('blender>=2.8')
makedepends=()
provides=()
options=()
install=
changelog=
source=("https://github.com/stuffmatic/fSpy-Blender/releases/download/v$pkgver/fSpy-Blender-$pkgver.zip")
noextract=()
sha256sums=("ac10ee2b02f832d7d985928b4e10ff82f82e34e3245777fd4bd3615647e8f207")

package() {

	_version=$(blender --version | sed -E -n -e 's/.*([0-9]+\.[0-9]+)\.[0-9]+.*/\1/p')

	_addons="$pkgdir/usr/share/blender/$_version/scripts/addons/fspy"

	cd "$srcdir/$(ls -d */)"

	if [ ! -d "$_addons" ]; then
		mkdir -p "$_addons"
	fi

	for i in *; do
		cp -r "$i" "$_addons"
	done
}
