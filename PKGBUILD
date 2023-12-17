# Maintainer:TurtleRuss <tttturtleruss@gmail.com> 
pkgname=hustmirror-cli
pkgver=1.0.1
pkgrel=1
epoch=
pkgdesc="The command line tool (hustmirror-cli) is a small tool that can help you quickly change sources to HUST mirror sources."
arch=('x86_64')
license=('GPL')
url='https://gitee.com/hustmirror/hustmirror-cli'
groups=()
depends=()
makedepends=('make')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("$pkgname-stable.tar.gz::${url}/repository/archive/stable.tar.gz"
        "$pkgname-stable.patch")
noextract=()
sha256sums=('52e221c7f2317c4289752464e151cb85e6fa5628d32f1db1e9cd5f66dee486d3'
            'b282b2527d8463bc891e84413d3a672e3d6c3bada277f26b7056fe814bf9c5e4')
validpgpkeys=()

prepare() {
	cd "$pkgname-stable"
	patch -p1 -i "$srcdir/$pkgname-stable.patch"
}

build() {
	cd "$pkgname-stable"
	make
}

package() {
	cd "$pkgname-stable"
	sudo make install
}
