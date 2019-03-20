# Maintainer: peshane <social at peshane dot net>
pkgname=postgresqltuner
pkgver=1.0.1
pkgrel=1
pkgdesc="Simple script to analyse your PostgreSQL database configuration inspired by mysqltuner.pl"
arch=('any')
url="https://github.com/jfcoz/postgresqltuner"
license=('GPL')
depends=('perl' 'perl-dbd-pg')
makedepends=('git' 'markdown')
source=("postgresqltuner::git+https://github.com/jfcoz/${pkgname}.git#tag=${pkgver}")
md5sums=('SKIP')


build() {
	cd "$srcdir/${pkgname}"

    markdown ISSUE_TEMPLATE.md > ISSUE_TEMPLATE.html
    markdown README.fr.md > README.fr.html
    markdown README.md > README.html

}


package() {
	cd "$srcdir/${pkgname}"

    install -D -m0755 postgresqltuner.pl ${pkgdir}/usr/bin/postgresqltuner
    install -D -m0644 LICENSE.txt ${pkgdir}/usr/share/licenses/postgresqltuner/LICENSE
    install -D -m0644 ISSUE_TEMPLATE.md ${pkgdir}/usr/share/doc/postgresqltuner/ISSUE_TEMPLATE.md
    install -D -m0644 ISSUE_TEMPLATE.html ${pkgdir}/usr/share/doc/postgresqltuner/ISSUE_TEMPLATE.html
    install -D -m0644 README.fr.md ${pkgdir}/usr/share/doc/postgresqltuner/README.fr.md
    install -D -m0644 README.fr.html ${pkgdir}/usr/share/doc/postgresqltuner/README.fr.html
    install -D -m0644 README.md ${pkgdir}/usr/share/doc/postgresqltuner/README.md
    install -D -m0644 README.html ${pkgdir}/usr/share/doc/postgresqltuner/README.html

}
