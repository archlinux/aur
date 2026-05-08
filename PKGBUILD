# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: tee < teeaur at duck dot com >

pkgname=nocodb-bin
pkgver=2026.05.0
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
sha256sums=('2c5af20ce51f8e82a83f82229555febf174b9230564b3af36bcff54b9f6abc13'
            'cbad8f8d8eb636b3b19cce7131b1fe930cef68f9fbaeeb28ec90543319acf9d6')
sha256sums_x86_64=('07b84ebad204b0c1515ac811d68ec9c55167f1c2cef566dab120029a25080da0')


package() {
	cd "${srcdir}" || exit 1

	install -Dm755 "${_exe}" "${pkgdir}/usr/bin/${pkgname%-bin}"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
