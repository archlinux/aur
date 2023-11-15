# Maintainer: Slavi Pantaleev <slavi at devture.com>

pkgname=redshift-scheduler
pkgver=1.3.1
pkgrel=0
pkgdesc="Rule-based screen temperature changer (based on redshift)"
arch=('any')
url="https://github.com/spantaleev/redshift-scheduler"
license=('GPL3')
depends=('redshift' 'glib2>=2.34' 'libgee')
makedepends=('git' 'vala')
source=('git+https://github.com/spantaleev/redshift-scheduler.git#tag='$pkgver)
md5sums=('SKIP')

build() {
	cd "$srcdir/$pkgname"
	/bin/bash build.sh
}

package() {
	cd "$srcdir/$pkgname"
	install -Dm 644 resources/rules.conf.dist $pkgdir/usr/share/redshift-scheduler/rules.conf.dist
	install -Dm 644 resources/redshift-scheduler.desktop $pkgdir/usr/share/applications/redshift-scheduler.desktop
	install -Dm 755 build/redshift-scheduler $pkgdir/usr/bin/redshift-scheduler
}
