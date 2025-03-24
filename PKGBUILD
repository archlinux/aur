# Maintainer: Diab Neiroukh <public at thezest dot dev>

pkgname="ssacli-bin"
pkgver="6.40_6.0"
pkgrel=1
arch=("x86_64")
pkgdesc="HPE Smart Storage Administrator CLI"
license=("custom")
depends=(
	"bash"
)
provides=("ssacli")
source=("https://downloads.linux.hpe.com/SDR/repo/mcp/oracle/9/x86_64/current/${pkgname//-bin/}-${pkgver//_/-}.x86_64.rpm")
b2sums=("935880806d07a461c47e82fa8cafee8acb6e19d7f0022da31ff327d0651918d6f39ef073f2e3418bdac8069ba81bd592708e515f4320a729038ab8254b2be715")

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
