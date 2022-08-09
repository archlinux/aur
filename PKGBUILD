# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Your Name <youremail@domain.com>
pkgname=crepl-git
pkgver=0.1.0
pkgrel=0
pkgdesc="compile and execute C code as you type it"
arch=('x86_64')
url="https://github.com/l1mey112/crepl"
license=('GPL3')
depends=()
makedepends=('git' 'gcc' 'make' 'vlang' 'tcc')
source=("crepl::git+https://github.com/l1mey112/crepl")
sha512sums=('SKIP')

build() {
	cd crepl
	v -o crepl -prod -cc gcc -showcc .
}

package() {
	cd crepl
	install -Dm755 crepl   "$pkgdir/usr/bin/crepl"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/crepl/LICENSE"
}
