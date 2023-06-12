pkgname=uniciv-bin
pkgver=4.6.19
pkgrel=1
pkgdesc="Uniciv bin"
arch=('x86_64')
url="https://github.com/yairm210/Unciv"
options=()
license=()
source=(
	"${pkgname}-${pkgver}.jar::https://github.com/yairm210/Unciv/releases/download/${pkgver}/Unciv.jar"
	"uniciv::https://pastebin.com/raw/YYcHRv48"
)
sha256sums=(
	'db53e07bf6faa59e1cb0656bd89d15eabc1918a04412a124b9e7feee2986b65e'
	'90697f0f9e48b4d3f8b5e636731af870a091582195ba84c0d8a2a3360564b606'
)

build() {
	sed -i -e 's/\r$//' uniciv
}

package() {
	cd "$srcdir"
	mkdir -p $pkgdir/usr/lib/uniciv
	cp ${pkgname}-${pkgver}.jar $pkgdir/usr/lib/uniciv/uniciv.jar
	mkdir -p $pkgdir/usr/bin
	cp uniciv $pkgdir/usr/bin/uniciv
	chmod +x $pkgdir/usr/bin/uniciv
}
