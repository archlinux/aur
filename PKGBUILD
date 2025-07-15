# Maintainer: Markus Moser<marmoser@wu.ac.at>
pkgname=naviserver-postgres-connector
pkgver=5.0.0
pkgrel=1
pkgdesc="Naviserver postgres connector"
arch=('x86_64')
url="https://bitbucket.org/naviserver/naviserver/"
license=('MPL')
depends=('tcllib>=1.17' 'tcl>=8.5.18' 'postgresql>=9.4' 'naviserver>=5.00')
source=("http://download.sourceforge.net/sourceforge/naviserver/naviserver-${pkgver}-modules.tar.gz")
md5sums=("99c1fc0aecf8768a9870c7b9501bd1b8")

build() {
    cd modules/nsdbpg
    #modules
    _pg_incl=/usr/include/postgresql
    _pg_lib=/usr/lib
    _pg_user=postgres
    make PGLIB=${_pg_lib} PGINCLUDE=${_pg_incl} NAVISERVER=/usr/local/ns
}

package() {
    install -m 644 -D modules/nsdbpg/nsdbpg.so ${pkgdir}/usr/local/ns/bin/nsdbpg.so
}

