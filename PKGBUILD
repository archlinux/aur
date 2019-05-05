# Maintainer: TheGoliath
# Contributor: TheGoliath
pkgname=squidguard
pkgver=1.6.0
pkgrel=1
pkgdesc="Filter and redirector plugin for Squid. SquidGuard is a free, flexible and ultra fast filter, redirector and access controller plugin for squid."
arch=('i686' 'x86_64')
url="http://www.squidguard.org"
license=('GPL')
groups=('')
depends=('db' 'libldap>=2.4.7' 'bison' 'flex' 'squid')
optdepends=('liburi-perl'
            'openldap'
            'perl-libwww'
            'squid>=3.4.0'
            'squidguard-doc')
backup=('etc/logrotate.d/squidguard' 'etc/squidguard/squidGuard.conf.default')
options=('!strip' '!emptydirs')
install=${pkgname}.install
source_i686=("http://ftp.br.debian.org/debian/pool/main/s/squidguard/squidguard_1.6.0-1_amd64.deb")
source_x86_64=("http://ftp.br.debian.org/debian/pool/main/s/squidguard/squidguard_1.6.0-1_i386.deb")
sha512sums_i686=('86bb1d849bd3fabc6e0cbe954bfbcbee537b6cfe225ee48436e8f6f4cb9332835ce8ef1845d6dcaae6e4145cb583a45e631463e116650786e020fe75050a78f9')
sha512sums_x86_64=('107b4fe5630656a052da5b07e3da3294b105a9a1481bde9ff738c7bb6380c35801e0f62819cb6ec2bd014ce8695bf904838ac0bc09c203e3faac637f9cc13532')

package(){

	# Extract package data
	tar xf data.tar.xz -C "${pkgdir}"

	# Fix directories structure differencies
	cd "${pkgdir}"

	install -D -m644 "/usr/share/doc/squidguard/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	mkdir usr/bin 2> /dev/null; mv usr/sbin/* usr/bin; rm -rf usr/sbin

	cd ..

}
