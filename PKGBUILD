# Maintainer: Timo Sarawinski <timo@it-kraut.net>

pkgname=mysqltuner
pkgver=2.6.2
_tag='d49a40a594add5c04e60b5347c1d06e8f60cecff'
pkgrel=4
pkgdesc='MySQLTuner - review configuration quickly and make adjustments to increase performance and stability'
arch=('any')
url='http://www.mysqltuner.com'
license=('GPL')
makedepends=('git' 'discount')
depends=('perl')
source=("mysqltuner::git+https://github.com/rackerhacker/MySQLTuner-perl.git#tag=${_tag}"
	"mariadb-versions.patch")
sha256sums=('f54ce0c4180e89eee4bb9b281df85076d26882e0b9c9be1ac4e244d2b61f56bf'
            'ee987ad756e2612ff4deecb98bd668ff9a4d594962edb5e81da139afcee14caf')


prepare() {
	cd mysqltuner/
	patch -i ../mariadb-versions.patch mysqltuner.pl
}

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

