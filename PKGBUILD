# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: tee < teeaur at duck dot com >

pkgname=nocodb-bin
pkgver=0.301.3
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
sha256sums=('efd83f8381255c4d415922aca98a40c6d3727fa8a623164dbe7381db9e9b3c1e'
            'cbad8f8d8eb636b3b19cce7131b1fe930cef68f9fbaeeb28ec90543319acf9d6')
sha256sums_x86_64=('91fb5b0fac4ab50b563e2d2e72b86584fa64baf29988af68a69ac9f4e201e084')


package() {
	cd "${srcdir}" || exit 1

	install -Dm755 "${_exe}" "${pkgdir}/usr/bin/${pkgname%-bin}"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
