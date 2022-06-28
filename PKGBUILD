# Maintainer: Max Gautier <mg@max.gautier.name>
pkgname=msmtpq-systemd
pkgver=1.0.0
pkgrel=1
pkgdesc="Systemd unit for queuing and sending mail"
arch=(any)
license=('GPL')
groups=()
depends=(msmtp)
source=(msmtp-flush-mail msmtp.path msmtpq-systemd msmtp.service)
sha512sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP')

package() {
	for i in msmtp.{path,service}
	do
		install -Dm644 $i $pkgdir/usr/lib/systemd/user/$i
	done
	for i in msmtp{-flush-mail,q-systemd}
	do
		install -Dm755 $i $pkgdir/usr/bin/$i
	done
}
