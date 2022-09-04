# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Nguyen Hong Hiep <ahifdifo@domain.com>
pkgname=hello-world
_pkgname=helloworld
pkgver=.r1.c68245d
pkgrel=2
pkgdesc="Just a test package, will be removed soon"
arch=('x86_64')
url="https://github.com/justanoobcoder/helloworld"
license=('custom')
depends=('cowsay')
makedepends=('gcc' 'git' 'cmatrix')
conflicts=('helloworld')
source=("git+$url")
md5sums=('SKIP')

pkgver() {
    cd "${_dir}"
    printf "%s.r%s.%s" "$(awk '/^Version/ {print $2}' NEWS | head -1)" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$_pkgname"
	make
}

package() {
	cd "$_pkgname"
	make DESTDIR="$pkgdir/" install
}
