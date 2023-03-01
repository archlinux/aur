# Maintainer: Christian Hesse <mail@eworm.de>

pkgname=mysqltuner
pkgver=2.1.0
_tag='ea29f3e0d4b77333f32fcaff3c1636759dd5975a'
pkgrel=1
pkgdesc='MySQLTuner - review configuration quickly and make adjustments to increase performance and stability'
arch=('any')
url='http://www.mysqltuner.com'
license=('GPL')
makedepends=('git' 'markdown')
depends=('perl')
source=("mysqltuner::git://github.com/rackerhacker/MySQLTuner-perl.git#tag=${_tag}")
sha256sums=('SKIP')

build() {
	cd mysqltuner/

	markdown CONTRIBUTING.md > CONTRIBUTING.html
	markdown INTERNALS.md > INTERNALS.html
	markdown README.md > README.html
	markdown USAGE.md > USAGE.html
}

package() {
	cd mysqltuner/

	install -D -m0755 mysqltuner.pl ${pkgdir}/usr/bin/mysqltuner
	install -D -m0644 LICENSE ${pkgdir}/usr/share/licenses/mysqltuner/LICENSE
	install -D -m0644 CONTRIBUTING.md ${pkgdir}/usr/share/doc/mysqltuner/CONTRIBUTING.md
	install -D -m0644 CONTRIBUTING.html ${pkgdir}/usr/share/doc/mysqltuner/CONTRIBUTING.html
	install -D -m0644 INTERNALS.md ${pkgdir}/usr/share/doc/mysqltuner/INTERNALS.md
	install -D -m0644 INTERNALS.html ${pkgdir}/usr/share/doc/mysqltuner/INTERNALS.html
	install -D -m0644 README.md ${pkgdir}/usr/share/doc/mysqltuner/README.md
	install -D -m0644 README.html ${pkgdir}/usr/share/doc/mysqltuner/README.html
	install -D -m0644 USAGE.md ${pkgdir}/usr/share/doc/mysqltuner/USAGE.md
	install -D -m0644 USAGE.html ${pkgdir}/usr/share/doc/mysqltuner/USAGE.html
	install -D -m0644 LICENSE ${pkgdir}/usr/share/licenses/mysqltuner/LICENSE
        install -D -m0644 vulnerabilities.csv ${pkgdir}/usr/share/mysqltuner/vulnerabilities.csv
        install -D -m0644 basic_passwords.txt ${pkgdir}/usr/share/mysqltuner/basic_passwords.txt
}

