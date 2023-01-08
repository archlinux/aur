# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Prabuddh Mathur <prabuddhmathur2002@gmail.com>
pkgname=enchiridion-robin-homer-git
pkgver=1.0.r1.e6b14ab
pkgrel=1
epoch=
pkgdesc="A script to run The Enchiridion of Epictetus narrated by Robin Homer of Vox Stoica on Youtube. Specific parts can be played along with any random part from it."
arch=(x86_64 i686)
url="https://github.com/PrabuddhMathur/enchiridion-robin-homer-git.git"
license=('MIT')
groups=()
depends=(ffmpeg)
makedepends=(git)
checkdepends=()
optdepends=()
provides=(the_enchiridion)
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("git+$url")
noextract=()
md5sums=('SKIP')
validpgpkeys=()

pkgver(){
	cd "${_pkgname}"
	printf "1.0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
package() {
	cd "${pkgname}"
	sudo mkdir -p /usr/bin/"${pkgname}"
	sudo cp -rf * /usr/bin/"${pkgname}"
	sudo mv /usr/bin/"${pkgname}"/enchiridion.sh /usr/bin/

}
