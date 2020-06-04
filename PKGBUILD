# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Mayank Gite <mayankgite@protonmail.com>
pkgname=deathnote
pkgver=1.0.r30.99e6741
pkgrel=1
pkgdesc="This is the DeathNote. It can kill, not human's but processes and sessions executing in your system."
arch=('any')
url="https://gitlab.com/mayankgite/deathnote.git"
license=('GPL')
groups=()
depends=(figlet lolcat)
makedepends=(git)
checkdepends=()
optdepends=()
provides=(deathnote)
conflicts=()
replaces=()
backup=()
options=()
changelog=
source=("deathnote"
        "deathnote.desktop")
noextract=()
md5sums=('b99d9e4a63729ceebf6a752852ff3f18'
         'a8f6a7dbfe88951ff2541da4be218952')
validpgpkeys=()

pkgver() {
	cd "${_pkgname}"
	printf "1.0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  install -Dm755 "$srcdir"/deathnote "$pkgdir"/usr/bin/deathnote
  install -Dm644 "$srcdir"/deathnote.desktop "$pkgdir"/usr/share/applications/deathnote.desktop
}
