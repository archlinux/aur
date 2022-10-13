# Maintainer: Rihards Skuja <rhssk at posteo dot eu>

pkgname=slc-cli
pkgver=1.0.3
pkgrel=1
pkgdesc='Command line tool to generate projects with Silicon Labs SDK'
arch=('x86_64')
url='https://siliconlabs.github.io/slc-specification'
license=('unknown')
options=('!strip')
depends=('java-runtime' 'python-requests' 'python-websockets' 'python-colorama')
source=('https://www.silabs.com/documents/login/software/slc_cli_linux.zip')
sha256sums=('ec0928a02a3e0cae5e1fc958592e40dde9da464359d2ee3ecf359fe3bc4becee')

package() {
	cd "slc_cli"
	install -d "$pkgdir"/{usr/bin,opt/$pkgname}
	cp -a {bin,lib,slc} "$pkgdir/opt/$pkgname/"
	echo "python3 /opt/$pkgname/slc \$@" > "$pkgdir/usr/bin/slc"
	chmod +x "$pkgdir/usr/bin/slc"
}
