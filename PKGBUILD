# Maintainer: Timo Sarawinski <timo@it-kraut.net>

pkgname=mysqltuner
pkgver=2.9.1
_tag='a296842fe5ff33cbd9515b773af8ea8cfcda055c'
pkgrel=1
pkgdesc='MySQLTuner - review configuration quickly and make adjustments to increase performance and stability'
arch=('any')
url='http://www.mysqltuner.com'
license=('GPL')
makedepends=('git' 'discount' )
depends=('perl')
source=("mysqltuner::git+https://github.com/rackerhacker/MySQLTuner-perl.git#tag=${_tag}"
	"mariadb-versions.patch")
sha256sums=('df1313932ed7c5e82261bc65083b61def477a12c7b1fcbd9501b82a9408835cd'
            'df825b040b27556cf1ad3e798e6be84311f8ad363743ce8402a8270fa44c14b2')


#prepare() {
#	cd mysqltuner/
#	patch -i ../mariadb-versions.patch mysqltuner.pl
#}

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
        install -D -m0644 basic_passwords.txt ${pkgdir}/usr/share/mysqltuner/basic_passwords.txt
}

