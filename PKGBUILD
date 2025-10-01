# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: tee < teeaur at duck dot com >

pkgname=nocodb-bin
pkgver=0.265.0
pkgrel=1
pkgdesc="Open Source Airtable Alternative: Turns any MySQL, PostgreSQL, SQL Server, SQLite & MariaDB into a smart spreadsheet."

arch=("x86_64")
license=('AGPL-3.0-only')

url="https://nocodb.com"
_src="https://github.com/nocodb/nocodb"

provides=(nocodb)
conflicts=(nocodb)

install=post_install.install
options=(!strip)

_exe="$pkgname-$pkgver-$CARCH"

source=("${_src}/raw/${pkgver}/README.md"
		"${_src}/raw/${pkgver}/LICENSE")
source_x86_64=("${_exe}::${_src}/releases/download/${pkgver}/Noco-linux-x64")
sha256sums=('3a3075d64fd33570dfb460337131c0fe0d5d9a4b8a3434a984862d39c4581918'
            'd8de517917a591daa447d6be28ffb2fac866703e4feb65e86221be9a22d3033a')
sha256sums_x86_64=('e63afd12f3f6b1bd78859857ce847f94486fea5a8cbe72987f0cf22426fbfcbf')


package() {
	cd "${srcdir}" || exit 1

	install -Dm755 "${_exe}" "${pkgdir}/usr/bin/${pkgname%-bin}"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
