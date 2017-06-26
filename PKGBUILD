# Maintainer: Christian Hesse <mail@eworm.de>
# Contributor: Ansuransax <ansuransax at hotmail dot com>

pkgname=sec
pkgver=2.7.11
pkgrel=1
pkgdesc='A logfile monitoring tool with support for event correlation, written in perl'
arch=('i686' 'x86_64')
url='http://kodu.neti.ee/~risto/sec/'
license=('GPL')
depends=('perl')
source=("http://downloads.sourceforge.net/simple-evcorr/${pkgname}-${pkgver}.tar.gz"
	'sec.service')
sha256sums=('59cd744c36be43c0cb69f1570d2aa6911ebb3492ff01fc292347ec8876dfe991'
            'd69d000433162aa82a1d184df823185d739e2ab8a2d631b6adb2189f9e1839c4')

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
	install -D -m0644 ${srcdir}/sec.service ${pkgdir}/usr/lib/systemd/system/sec.service
}

