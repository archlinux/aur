# Maintainer: Yassine Oudjana <y.oudjana@protonmail.com>

pkgname=derelict-glfw3
_ver=4.0.0-beta.1
pkgver=${_ver//-/_}
pkgrel=1
pkgdesc="A dynamic binding to the GLFW 3 library."
arch=('x86_64')
url="https://github.com/DerelictOrg/DerelictGLFW3"
license=('Boost')
makedepends=('dub')
source=("https://github.com/DerelictOrg/DerelictGLFW3/archive/refs/tags/v$_ver.tar.gz")
sha256sums=('468b90eff33b8c0b38329e6df057cbf70cacc7b65c34f350a7b7b03a738d08ee')

build() {
	cd DerelictGLFW3-$_ver

	dub build
}

package() {
	cd DerelictGLFW3-$_ver

	install -Dm0755 -t "$pkgdir/usr/lib/" "lib/libDerelictGLFW3.a"
	mkdir -p "$pkgdir/usr/include/d/derelict/glfw3"
	cp -R --no-dereference --preserve=mode,links "source/derelict/glfw3" "$pkgdir/usr/include/d/derelict/"
}

