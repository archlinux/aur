# Maintainer: Timo Sarawinski <timo@it-kraut.net>

pkgname=mysqltuner
pkgver=2.6.1
_tag='a0784d7b4902ed5aa2729e9a3be332e1d9128433'
pkgrel=1
pkgdesc='MySQLTuner - review configuration quickly and make adjustments to increase performance and stability'
arch=('any')
url='http://www.mysqltuner.com'
license=('GPL')
makedepends=('git' 'discount')
depends=('perl')
source=("mysqltuner::git+https://github.com/rackerhacker/MySQLTuner-perl.git#tag=${_tag}")
sha256sums=('6dd93e8b09e0db419d990e1e0c91e76b7649f3a71c7aae40d5f548f55295ef0e')

build() {
	cd mysqltuner/

	markdown CONTRIBUTING.md > CONTRIBUTING.html
	markdown INTERNALS.md > INTERNALS.html
	markdown README.md > README.html
        markdown README.fr.md > README.fr.html
        markdown README.it.md > README.it.html
        markdown README.ru.md > README.ru.html
	markdown USAGE.md > USAGE.html
        markdown CODE_OF_CONDUCT.md > CODE_OF_CONDUCT.html
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
        install -D -m0644 README.fr.md ${pkgdir}/usr/share/doc/mysqltuner/README.fr.md
        install -D -m0644 README.it.md ${pkgdir}/usr/share/doc/mysqltuner/README.it.md
        install -D -m0644 README.ru.md ${pkgdir}/usr/share/doc/mysqltuner/README.ru.md
        install -D -m0644 README.fr.html ${pkgdir}/usr/share/doc/mysqltuner/README.fr.html
        install -D -m0644 README.it.html ${pkgdir}/usr/share/doc/mysqltuner/README.it.html
        install -D -m0644 README.ru.html ${pkgdir}/usr/share/doc/mysqltuner/README.ru.html
	install -D -m0644 USAGE.md ${pkgdir}/usr/share/doc/mysqltuner/USAGE.md
	install -D -m0644 USAGE.html ${pkgdir}/usr/share/doc/mysqltuner/USAGE.html
	install -D -m0644 LICENSE ${pkgdir}/usr/share/licenses/mysqltuner/LICENSE
        install -D -m0644 CODE_OF_CONDUCT.md ${pkgdir}/usr/share/doc/mysqltuner/CODE_OF_CONDUCT.md
        install -D -m0644 CODE_OF_CONDUCT.html ${pkgdir}/usr/share/doc/mysqltuner/CODE_OF_CONDUCT.html
        install -D -m0644 vulnerabilities.csv ${pkgdir}/usr/share/mysqltuner/vulnerabilities.csv
        install -D -m0644 basic_passwords.txt ${pkgdir}/usr/share/mysqltuner/basic_passwords.txt
}

