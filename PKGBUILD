# Maintainer: Christian Hesse <mail@eworm.de>
# Contributor: Ansuransax <ansuransax at hotmail dot com>

pkgname=sec
pkgver=2.9.3
pkgrel=1
pkgdesc='A logfile monitoring tool with support for event correlation, written in perl'
arch=('i686' 'x86_64')
url='https://simple-evcorr.github.io/'
license=('GPL')
depends=('perl')
source=("https://github.com/simple-evcorr/sec/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('280f5b94eebbf7efbf5a7d7e417beae75415a7dc5103a2d0fdb3008568fb9f30')

package() {
	cd ${srcdir}/${pkgname}-${pkgver}

	# install binaries and scripts
	install -D -m0755 sec ${pkgdir}/usr/bin/sec
	install -D -m0755 contrib/convert.pl ${pkgdir}/usr/share/${pkgname}/contrib/convert.pl
	install -D -m0755 contrib/swatch2sec.pl ${pkgdir}/usr/share/${pkgname}/contrib/swatch2sec.pl

	# install license, manpage, changelog and readme
	install -D -m0644 COPYING ${pkgdir}/usr/share/licenses/${pkgname}/COPYING
	install -D -m0644 sec.man ${pkgdir}/usr/share/man/man1/sec.1
	install -D -m0644 ChangeLog ${pkgdir}/usr/share/${pkgname}/ChangeLog
	install -D -m0644 README ${pkgdir}/usr/share/${pkgname}/README

	# install systemd service
	install -D -m0644 contrib/suse.service ${pkgdir}/usr/lib/systemd/system/sec.service
}

