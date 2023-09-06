# Maintainer: Konstantin Pereiaslov <perk11@perk11.info>
pkgname=runwhenidle
pkgver=0.3.0
pkgrel=1
pkgdesc="Run a computentionally intensive program when user is not in front of the computer."
arch=('x86_64')
url="https://github.com/perk11/runwhenidle"
license=('GPL')
depends=('libxss' 'libxext' 'libx11' 'libxdmcp' 'libxau' 'libxcb')
makedepends=('git')
_tag=efa21a0f20c2896161cdc407f80584ff32ad4df3 #git rev-parse $pkgver
source=("git+https://github.com/perk11/runwhenidle.git?signed#tag=$_tag")
sha256sums=('SKIP')

build() {
	cd $pkgname
	make release
	strip ./runwhenidle
}

package() {
	install -Dm755 $pkgname/runwhenidle "$pkgdir"/usr/bin/$pkgname
}
