# Maintainer: Nullptrderef <nullptrderef@national.shitposting.agency>
_pkgdate="20231030_0110_54"
_pkgcommit="bf5217b"
_pkghash="00b21531791f772b121ab3d803ea5402b2f735fb996348753ad340085ef0a60435e2227ea9c6972c6e5bfb877d626d54690efd4340363d4d59daa7f8a8c2224a"

_reposerver=github.com
_reponame=pixelflut
_repoauthor=defnull
_repo=https://$_reposerver/$_repoauthor/$_reponame
_pkgname=pixelnuke
_pkgsubdir=$_pkgname

_builddir="pixelflut-$_pkgcommit/$_pkgsubdir"

pkgname="$_pkgname"
pkgver="${_pkgdate}_${_pkgcommit}"
pkgrel="1"
epoch=
pkgdesc="The C implementation of Pixelflut"
arch=('x86_64')
url="$_repo"
license=('unknown')
groups=()
depends=(
  base
  glew
  glfw
  libevent
  libdecor
)
makedepends=(
  base-devel
  make
  gcc
)
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://codeload.github.com/$_repoauthor/$_reponame/zip/$_pkgcommit")
noextract=()
sha512sums=(
	$_pkghash
)
validpgpkeys=()

# prepare() {
# 	cd "$_builddir"
#   # apply any necessary patches here
# }

build() {
	cd "$_builddir"
	make
}

package() {
	cd "$_builddir"
	install -Dm755 pixelnuke "$pkgdir/usr/bin/pixelnuke"
}
