# Maintainer: Rihards Skuja <rhssk at posteo dot eu>

pkgname=slc-cli
pkgver=5.10.2.1
pkgrel=1
pkgdesc='Command line tool to generate projects with Silicon Labs SDK'
arch=('x86_64')
url='https://siliconlabs.github.io/slc-specification'
license=('unknown')
options=('!strip')
depends=('java-runtime' 'python-requests' 'python-websockets' 'python-colorama')
source=("$pkgname-$pkgver.zip::https://www.silabs.com/documents/login/software/slc_cli_linux.zip")
noextract=("$pkgname-$pkgver.zip")
sha256sums=('f91e2e8898fcbeaccad61a554d4fd5ef9a469008fdc2dbe70ae7cc541f24b44f')

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
