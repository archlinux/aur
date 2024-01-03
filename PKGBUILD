# Maintainer: Rihards Skuja <rhssk at posteo dot eu>

pkgname=slc-cli
pkgver=5.8.0.0
pkgrel=1
pkgdesc='Command line tool to generate projects with Silicon Labs SDK'
arch=('x86_64')
url='https://siliconlabs.github.io/slc-specification'
license=('unknown')
options=('!strip')
depends=('java-runtime' 'python-requests' 'python-websockets' 'python-colorama')
source=("$pkgname-$pkgver.zip::https://www.silabs.com/documents/login/software/slc_cli_linux.zip")
noextract=("$pkgname-$pkgver.zip")
sha256sums=('f99d6bc2c4d002f397bcc27bd389eebfabb230b863e349da614f838b53274d3f')

prepare() {
	bsdtar -xpf "$pkgname-$pkgver.zip"
}

package() {
	cd "slc_cli"
	install -d "$pkgdir"/{usr/bin,opt/$pkgname}
	cp -a * "$pkgdir/opt/$pkgname/"
	echo "sh /opt/$pkgname/slc \$@" > "$pkgdir/usr/bin/slc"
	chmod +x "$pkgdir/usr/bin/slc"
}
