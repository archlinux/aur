# Maintainer: pappy <pappy _AT_ a s c e l i o n _DOT_ com>

pkgname=rbldnsd-sync
pkgver=1.0.0
pkgrel=1
pkgdesc="Synchronization for RBLDNSD"
arch=(x86_64)
license=(GPL)
source=($pkgname.service
		$pkgname.timer
		$pkgname.sh
		$pkgname.opts
		)
depends=(rbldnsd rsync)
install=$pkgname.install
backup=(etc/conf.d/$pkgname)

sha256sums=('3536ec30d5b4d897c178d240608a55e9ee140630514523a9c4651bbb77c2916c'
            '69d23c6043d96b40f539b178d452f2753d602a68f3d5381b2c54cc142f70aad2'
            '5dee2c9126c87b06e1da5547b47d033ffcfa0165c5fd419322a7f249c5b82f9a'
            '502c62f50f600261f0b63c3707bf5fa5601faa807b4aa4d7a3410fd58eaa2b70')

package()
{
	install -Dm644 $pkgname.opts $pkgdir/etc/conf.d/$pkgname
	install -Dm755 $pkgname.sh $pkgdir/usr/bin/$pkgname
	install -Dm644 $pkgname.service $pkgdir/usr/lib/systemd/system/$pkgname.service
	install -Dm644 $pkgname.timer $pkgdir/usr/lib/systemd/system/$pkgname.timer
}

