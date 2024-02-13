# Maintainer: Timo Sarawinski <timo@it-kraut.net>

pkgname=mysqltuner
pkgver=2.5.3
_tag='ac43eee9692c7f5ffcbdd975c2bd370fda5868f8'
pkgrel=2
pkgdesc='MySQLTuner - review configuration quickly and make adjustments to increase performance and stability'
arch=('any')
url='http://www.mysqltuner.com'
license=('GPL')
makedepends=('git' 'discount')
depends=('perl')
source=("mysqltuner::git+https://github.com/rackerhacker/MySQLTuner-perl.git#tag=${_tag}"
	"mariadb11.patch")
sha256sums=('SKIP'
            'd49b85da2cb9931c16a589dd3ebdfa2cbf5ad6406186c51488404d21b23d6a2a')

prepare() {
	cd mysqltuner/
	patch -i "${srcdir}"/mariadb11.patch
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

