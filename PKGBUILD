# Maintainer: Rihards Skuja <rhssk at posteo dot eu>

pkgname=slc-cli
pkgver=5.4.2
pkgrel=1
pkgdesc='Command line tool to generate projects with Silicon Labs SDK'
arch=('x86_64')
url='https://siliconlabs.github.io/slc-specification'
license=('unknown')
options=('!strip')
depends=('java-runtime' 'python-requests' 'python-websockets' 'python-colorama')
source=('https://www.silabs.com/documents/login/software/slc_cli_linux.zip')
noextract=('slc_cli_linux.zip')
sha256sums=('0befd4e3c919739b1ba366f6d0aac6767e9e552eb023ec2c0cacb880ad301b40')

prepare() {
	unzip slc_cli_linux.zip
}

package() {
	cd "slc_cli"
	install -d "$pkgdir"/{usr/bin,opt/$pkgname}
	cp -a {bin,lib,slc} "$pkgdir/opt/$pkgname/"
	echo "python3 /opt/$pkgname/slc \$@" > "$pkgdir/usr/bin/slc"
	chmod +x "$pkgdir/usr/bin/slc"
}
