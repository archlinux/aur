# Maintainer: Alex Henrie <alexhenrie24@gmail.com>
pkgname=guiffy-bin
pkgver=12.3
pkgrel=1
pkgdesc='Visual file compare diff tool, merge tool, and folder compare tool'
arch=('x86_64')
url='https://www.guiffy.com/'
license=('custom')
depends=('java-runtime')
provides=("guiffy=${pkgver}")
conflicts=('guiffy')
options=('!strip')
source=("https://www.guiffy.com/download/Linux/NoVM/Guiffy-$pkgver-linux-x64-installer.run")
sha256sums=('1930a64791514a8962909b2b6b065c8cf41e0f90ad34f56999b2bd0d6635eb62')

package() {
	chmod +x "Guiffy-$pkgver-linux-x64-installer.run"
	./Guiffy-$pkgver-linux-x64-installer.run --mode unattended --prefix "$pkgdir/opt/guiffy"

	mkdir -p "$pkgdir/usr/bin"
	ln -s /opt/guiffy/guiffy "$pkgdir/usr/bin/guiffy"

	mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
	ln -s /opt/guiffy/license.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
