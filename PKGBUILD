# Maintainer: Christian Hesse <mail@eworm.de>

pkgname=mysqltuner
pkgver=1.5.1
pkgrel=1
pkgdesc='MySQLTuner - review configuration quickly and make adjustments to increase performance and stability'
arch=('any')
url='http://www.mysqltuner.com'
license=('GPL')
makedepends=('git' 'markdown')
depends=('perl')
source=("mysqltuner::git://github.com/rackerhacker/MySQLTuner-perl.git#tag=v${pkgver}")
sha256sums=('SKIP')

build() {
	cd mysqltuner/

	markdown README.md > README.html
}

package() {
	cd mysqltuner/

	install -D -m0755 mysqltuner.pl ${pkgdir}/usr/bin/mysqltuner
	install -D -m0644 LICENSE ${pkgdir}/usr/share/licenses/mysqltuner/LICENSE
	install -D -m0644 README.md ${pkgdir}/usr/share/doc/mysqltuner/README.md
	install -D -m0644 README.html ${pkgdir}/usr/share/doc/mysqltuner/README.html
}

