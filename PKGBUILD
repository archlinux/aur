# Maintainer: Caleb Maclennan <caleb@alerque.com>
pkgname=openldap-migrationtools
_origname=MigrationTools
pkgver=47
pkgrel=3
pkgdesc='set of scripts for migrating data from local files (i.e. /etc/passwd) or a NIS domain to an LDAP directory'
url="https://www.padl.com/OSS/$_origname.html"
backup=()
depends=('openldap')
arch=('x86_64')
license=('BSD')
groups=('openldap' 'openldap-beta')
source=("https://www.padl.com/download/$_origname-$pkgver.tar.gz"
        'migration-tools.txt')
sha256sums=('9c1e3679ee17e74e69bd1f8854f7ac67513294d09c0d837d2db26f1b1a6782b0'
            '51ac36634bf71256f25a6c68d98d109ff4e6b306106298e54b7f9f36c02988fa')

package () {
	cd "$_origname-$pkgver"

	mkdir -p "$pkgdir"/usr/share/openldap/migration

	install -D -m644 -o0 -g0 CVSVersionInfo.txt "$pkgdir"/usr/share/openldap/migration/CVSVersionInfo.txt
	install -D -m644 -o0 -g0 README "$pkgdir"/usr/share/openldap/migration/README
	install -D -m644 -o0 -g0 "$srcdir"/migration-tools.txt "$pkgdir"/usr/share/openldap/migration/migration-tools.txt
	install -D -m755 -o0 -g0 migrate_aliases.pl "$pkgdir"/usr/share/openldap/migration/migrate_aliases.pl
	install -D -m755 -o0 -g0 migrate_all_netinfo_offline.sh "$pkgdir"/usr/share/openldap/migration/migrate_all_netinfo_offline.sh
	install -D -m755 -o0 -g0 migrate_all_netinfo_online.sh "$pkgdir"/usr/share/openldap/migration/migrate_all_netinfo_online.sh
	install -D -m755 -o0 -g0 migrate_all_nis_offline.sh "$pkgdir"/usr/share/openldap/migration/migrate_all_nis_offline.sh
	install -D -m755 -o0 -g0 migrate_all_nis_online.sh "$pkgdir"/usr/share/openldap/migration/migrate_all_nis_online.sh
	install -D -m755 -o0 -g0 migrate_all_nisplus_offline.sh "$pkgdir"/usr/share/openldap/migration/migrate_all_nisplus_offline.sh
	install -D -m755 -o0 -g0 migrate_all_nisplus_online.sh "$pkgdir"/usr/share/openldap/migration/migrate_all_nisplus_online.sh
	install -D -m755 -o0 -g0 migrate_all_offline.sh "$pkgdir"/usr/share/openldap/migration/migrate_all_offline.sh
	install -D -m755 -o0 -g0 migrate_all_online.sh "$pkgdir"/usr/share/openldap/migration/migrate_all_online.sh
	install -D -m755 -o0 -g0 migrate_automount.pl "$pkgdir"/usr/share/openldap/migration/migrate_automount.pl
	install -D -m755 -o0 -g0 migrate_base.pl "$pkgdir"/usr/share/openldap/migration/migrate_base.pl
	install -D -m755 -o0 -g0 migrate_common.ph "$pkgdir"/usr/share/openldap/migration/migrate_common.ph
	install -D -m755 -o0 -g0 migrate_fstab.pl "$pkgdir"/usr/share/openldap/migration/migrate_fstab.pl
	install -D -m755 -o0 -g0 migrate_group.pl "$pkgdir"/usr/share/openldap/migration/migrate_group.pl
	install -D -m755 -o0 -g0 migrate_hosts.pl "$pkgdir"/usr/share/openldap/migration/migrate_hosts.pl
	install -D -m755 -o0 -g0 migrate_netgroup.pl "$pkgdir"/usr/share/openldap/migration/migrate_netgroup.pl
	install -D -m755 -o0 -g0 migrate_netgroup_byhost.pl "$pkgdir"/usr/share/openldap/migration/migrate_netgroup_byhost.pl
	install -D -m755 -o0 -g0 migrate_netgroup_byuser.pl "$pkgdir"/usr/share/openldap/migration/migrate_netgroup_byuser.pl
	install -D -m755 -o0 -g0 migrate_networks.pl "$pkgdir"/usr/share/openldap/migration/migrate_networks.pl
	install -D -m755 -o0 -g0 migrate_passwd.pl "$pkgdir"/usr/share/openldap/migration/migrate_passwd.pl
	install -D -m755 -o0 -g0 migrate_profile.pl "$pkgdir"/usr/share/openldap/migration/migrate_profile.pl
	install -D -m755 -o0 -g0 migrate_protocols.pl "$pkgdir"/usr/share/openldap/migration/migrate_protocols.pl
	install -D -m755 -o0 -g0 migrate_rpc.pl "$pkgdir"/usr/share/openldap/migration/migrate_rpc.pl
	install -D -m755 -o0 -g0 migrate_services.pl "$pkgdir"/usr/share/openldap/migration/migrate_services.pl
	install -D -m755 -o0 -g0 migrate_slapd_conf.pl "$pkgdir"/usr/share/openldap/migration/migrate_slapd_conf.pl
}
