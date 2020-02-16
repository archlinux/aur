# Maintainer: pappy <pappy _AT_ a s c e l i o n _DOT_ com>

pkgname=gitbucket
pkgver=4.33.0
pkgrel=1
pkgdesc="A Git platform powered by Scala with easy installation, high extensibility & GitHub API compatibility"
arch=(any)
url=https://gitbucket.github.io
license=(AGPL3)
depends=(jre8-openjdk-headless)
provides=($pkgname)
install=$pkgname.install
backup=(etc/$pkgname/$pkgname.opts)
source=($pkgname-$pkgver.war::https://github.com/gitbucket/gitbucket/releases/download/$pkgver/$pkgname.war

		$pkgname.sh
		$pkgname.opts
		$pkgname.sysusers
		$pkgname.tmpfiles
		$pkgname.service
		)
noextract=($pkgname-$pkgver.war)
sha256sums=('35e190ddb7a2f9760d43617d2e6325c2a745ba66061daa3fa95cc9d871423506'
            '9e676104c506cfcf1c8e7db79fe0331b55726a0530f8ad6ccc33013190535982'
            '860d2afa0dae857f8ddd3c8de2911a60032e51aa3981b4282d525ec8cbe73638'
            '7839b30fafa179d3712ec4246450fbf56a70130de198da2265d872b76ac0ee0e'
            'c940b928564af0062b2d0acdec13f58313435eef8f0fa927d9531f73ed601648'
            '7ca63d855fedfe91078844f3a7d518631b17a9916ba1fbc585c3a4d345aed7ea')

package() {
	install -Dm755 $pkgname.sh $pkgdir/usr/lib/$pkgname/$pkgname
	install -Dm644 $pkgname-$pkgver.war $pkgdir/usr/lib/$pkgname/$pkgname.war
	install -Dm644 $pkgname.opts $pkgdir/etc/$pkgname/$pkgname.opts
	install -Dm644 $pkgname.sysusers $pkgdir/usr/lib/sysusers.d/$pkgname.conf
	install -Dm644 $pkgname.service $pkgdir/usr/lib/systemd/system/$pkgname.service
	install -Dm644 $pkgname.tmpfiles $pkgdir/usr/lib/tmpfiles.d/$pkgname.conf
}

