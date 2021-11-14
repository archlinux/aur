# Contributor: Adam Nielsen <malvineous@shikadi.net>
# Contributor: Vitaliy Berdinskikh <skipper13@archlinux.org.ua>
# Contributor: Andrea Agosti <cifvts@gmail.com>
# Contributor: Viliam Pucik <viliam.pucik@gmail.com>
# Maintainer: Adam Nielsen <malvineous@shikadi.net>

_pkgname=instantclient-jdbc
pkgname=oracle-${_pkgname}
pkgver=21.4.0.0.0
_pkgver_vendor_suffix=dbru
_urlver=214000
_unzippath=instantclient_21_4
pkgrel=1
pkgdesc="Additional support for XA, Internationalization, and RowSet operations under JDBC"
arch=('x86_64')
url="http://www.oracle.com/technetwork/database/features/instant-client/"
license=('custom:OTN')
depends=(oracle-instantclient-basic=$pkgver)
replaces=('instantclient-jdbc')
options=(!strip)

# These are the only files we want to include in the source package
source=(LICENSE
        "https://download.oracle.com/otn_software/linux/instantclient/${_urlver}/${_pkgname}-linux.x64-${pkgver}${_pkgver_vendor_suffix}.zip")
md5sums=('2d62e22e4f2d7e6d220fafde0f692a7d'
         '9a6d9d21ad3cdbd017c8d8dda17d0ecf')
sha256sums=('f904a30b07ddf7806a33620f93b94c3d315154d26a371ece48695bb3555064a2'
            '99008768b8335807c960eb9cf62f04e592bc910eb34022f3aa2c1a0a2643ae88')

package() {
	local basedir="$srcdir/${_unzippath}"
	install -d "$pkgdir/usr/lib"
	install -m 755 -t "$pkgdir/usr/lib" "$basedir/"*.so
	install -m 644 -t "$pkgdir/usr/lib" "$basedir/"*.jar
}
