# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: tee < teeaur at duck dot com >

pkgname=nocodb-bin
pkgver=0.301.2
pkgrel=1
pkgdesc="Open Source Airtable Alternative: Turns any MySQL, PostgreSQL, SQL Server, SQLite & MariaDB into a smart spreadsheet."

arch=("x86_64")
license=('AGPL-3.0-only')

url="https://nocodb.com"
_src="https://github.com/nocodb/nocodb"

provides=(nocodb)
conflicts=(nocodb)

install="${pkgname}.install"
options=(!strip)

_exe="$pkgname-$pkgver-$CARCH"

source=("${_src}/raw/${pkgver}/README.md"
	"${_src}/raw/${pkgver}/LICENSE.md")
source_x86_64=("${_exe}::${_src}/releases/download/${pkgver}/Noco-linux-x64")
sha256sums=('d92678ddd80d3124bfaedf8a94d35a9f13fc4cc1cf8b53ed2f868ce4b8c65b4e'
            '4f051606c68addfcc5eedd2898192e9dc11063f2895ebb407349adc487dbfc84')
sha256sums_x86_64=('9bf1d59232dba71f8502c796f68419b0918b1630c9509a527863f9abcf42c75d')


package() {
	cd "${srcdir}" || exit 1

	install -Dm755 "${_exe}" "${pkgdir}/usr/bin/${pkgname%-bin}"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
