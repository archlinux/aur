# Maintainer: Diab Neiroukh <public at thezest dot dev>

pkgname="ssacli-bin"
pkgver="6.60_8.0"
pkgrel=1
arch=("x86_64")
pkgdesc="HPE Smart Storage Administrator CLI"
license=("custom")
depends=("bash")
provides=("ssacli")
source=("https://downloads.linux.hpe.com/SDR/repo/mcp/Alma/10/x86_64/current/${pkgname//-bin/}-${pkgver//_/-}.x86_64.rpm")
sha256sums=('f0e5d18946adf2ececd2676205f8d3134bbe3b7a2bec731f9e751e893442a76c')

package() {
	mv "usr/man" "usr/share/man"
	mv "usr/sbin" "usr/bin"
	chmod 755 "usr/bin/ssacli"
	chmod 755 "usr/bin/ssascripting"
	chmod 755 "opt/smartstorageadmin/ssacli/bin/mklocks.sh"
	chmod 755 "opt/smartstorageadmin/ssacli/bin/rmstr"
	chmod 755 "opt/smartstorageadmin/ssacli/bin/ssacli"
	chmod 755 "opt/smartstorageadmin/ssacli/bin/ssascripting"
	install -D -m644 "opt/smartstorageadmin/ssacli/bin/ssacli.license" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
	rm "opt/smartstorageadmin/ssacli/bin/ssacli.license"
	cp -r "opt/." "$pkgdir/opt"
	cp -r "usr/." "$pkgdir/usr"
}
