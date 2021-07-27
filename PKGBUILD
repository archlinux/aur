# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>
# Contributor: Jonas Seibert <jonas+aur at seibert dot ninja>
# Contributor: Holger Rauch <holger dot rauch at posteo dot de>

pkgname=payara
pkgver=5.2021.5
pkgrel=1
pkgdesc="Jakarta EE (Java EE) & MicroProfile compatible application server for production and containerized deployments."
url="http://www.payara.fish/"
license=("CDDL" "GPL2")
depends=("java-environment>=8")
arch=("any")
options=(!strip)
source=("$pkgname-$pkgver.zip::https://search.maven.org/remotecontent?filepath=fish/$pkgname/distributions/$pkgname/$pkgver/$pkgname-$pkgver.zip"
        "payara.service")

sha256sums=('52fbc7272823739030475d8df97d05a526677ed7bbe73e2933264a93ee7c7806'
            'ffd73bddd3218a7c8ce6748cc73c77e84994faebed7f42285a9d81da351ecc2c')
sha512sums=('d9efc8a29251d93841f1ee5c1d2c6de8f1aa8b46149758cfbd4bca4ba3f1553c20a656e2eaf23e10d30d06046dac4339a789385c33cbbf3139891aa6c7157814'
            'c1a4d1f96357c8e8afd74a2e5eccbe0d319f3448485b3907e1a700320d1fb442dbfa18fb49231d1430ebd253034113101deeae22e003ac02033e7930962ae7ca')

package() {
	mkdir -p $pkgdir/opt
	cp -a payara5 $pkgdir/opt/payara
	install -D $srcdir/payara.service $pkgdir/usr/lib/systemd/system/payara.service
}
# vim:set ts=4 sw=4:
