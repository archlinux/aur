 # Thisis an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Your Name <youremail@domain.com>
pkgname=inpla-git
pkgver=r336.89d402a
pkgrel=1
epoch=
pkgdesc="Interaction nets as a programming language (the current version)"
arch=(any)
url="https://github.com/inpla/inpla"
license=('MIT')
groups=()
depends=(glibc)
makedepends=(flex bison git gcc)
checkdepends=()
optdepends=()
provides=(inpla)
conflicts=(inpla)
replaces=()
backup=()
options=()
install=
changelog=
source=("git+https://github.com/inpla/inpla"
        )
noextract=()
sha256sums=('SKIP')
validpgpkeys=()

pkgver(){
    cd $srcdir/inpla
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	pushd $srcdir/"inpla"
	make 
}

package() {
	find $srcdir -name "inpla" -type f -exec install -Dm755 {} -t $pkgdir/usr/bin \;
	find $srcdir -name LICENSE -type f -exec install -Dm644 {} -t $pkgdir/usr/share/licenses/$pkgname \;
}
