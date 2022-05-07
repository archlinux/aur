# Maintainer: Caleb Maclennan <caleb@alerque.com>

_origname=MigrationTools
pkgname=openldap-${_origname,,}
pkgver=47
pkgrel=5
pkgdesc='scripts for migrating data from local files or a NIS domain to an LDAP directory'
arch=(x86_64)
_web="http://web.archive.org/web/20150802074048"
url="$_web/https://www.padl.com/OSS/$_origname.html"
depends=(openldap)
license=(BSD)
groups=(openldap
        openldap-beta)
_archive="$_origname-$pkgver"
_origsource="https://www.padl.com/download/$_archive.tar.gz"
source=("$_web/$_origsource"
        migration-tools.txt)
sha256sums=('9c1e3679ee17e74e69bd1f8854f7ac67513294d09c0d837d2db26f1b1a6782b0'
            '51ac36634bf71256f25a6c68d98d109ff4e6b306106298e54b7f9f36c02988fa')

package () {
	cd "$_archive"
	install -Dm0755 -t "$pkgdir/usr/share/openldap/migration/" *.pl *.sh
	install -Dm0755 -t "$pkgdir/usr/share/openldap/migration/ads/" *.pl *.sh
	install -Dm0644 -t "$pkgdir/usr/share/openldap/migration/" CVSVersionInfo.txt migrate_common.ph
	install -Dm0644 -t "$pkgdir/usr/share/docs/$pkgname/" README ../migration-tools.txt
}
