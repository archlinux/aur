# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: tee < teeaur at duck dot com >

pkgname=nocodb-bin
pkgver=2026.05.1
pkgrel=1
pkgdesc="Open Source Airtable Alternative: Turns any MySQL, PostgreSQL, SQL Server, SQLite & MariaDB into a smart spreadsheet."

arch=("x86_64")
license=('SUL-1.0')

url="https://nocodb.com"
_src="https://github.com/nocodb/nocodb"

provides=(nocodb)
conflicts=(nocodb)
depends=(libgcc glibc libstdc++)

install="${pkgname}.install"
options=(!strip)

_exe="$pkgname-$pkgver-$CARCH"

source=("${_src}/raw/${pkgver}/README.md"
	"${_src}/raw/${pkgver}/LICENSE.md")
source_x86_64=("${_exe}::${_src}/releases/download/${pkgver}/Noco-linux-x64")
sha256sums=('2c5af20ce51f8e82a83f82229555febf174b9230564b3af36bcff54b9f6abc13'
            'cbad8f8d8eb636b3b19cce7131b1fe930cef68f9fbaeeb28ec90543319acf9d6')
sha256sums_x86_64=('01f0d38bad9014c00880bf54a24e130eed5a997275886e314e0f400f57373db0')


package() {
	cd "${srcdir}" || exit 1

	install -Dm755 "${_exe}" "${pkgdir}/usr/bin/${pkgname%-bin}"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
