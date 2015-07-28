# Maintainer: Slavi Pantaleev <s.pantaleev at gmail.com>

pkgname=redshift-scheduler
pkgver=1.1.1
pkgrel=1
pkgdesc="Rule-based screen temperature changer (like redshift)"
arch=('any')
url="https://github.com/spantaleev/redshift-scheduler"
license=('GPL3')
depends=('redshift' 'glib2>=2.34' 'libgee')
makedepends=('git' 'vala')
source=('vcs-repository::git://github.com/spantaleev/redshift-scheduler.git#tag='$pkgver)
md5sums=('SKIP')

build() {
	cd "$srcdir/vcs-repository"
	/bin/bash build.sh
}

package() {
	install -Dm 644 $srcdir/vcs-repository/resources/rules.conf.dist $pkgdir/usr/share/redshift-scheduler/rules.conf.dist
	install -Dm 755 $srcdir/vcs-repository/build/redshift-scheduler $pkgdir/usr/bin/redshift-scheduler
}
