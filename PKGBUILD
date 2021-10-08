# Maintainer: Tony Lambiris <tony@libpcap.net>
pkgname=mysqltcl
pkgver=3.052
pkgrel=2
pkgdesc="Mysqltcl allows to connect Mysql-Database from Tcl scripting language."
url="https://github.com/xdobry/mysqltcl"
arch=('any')
depends=('tcl' 'mariadb')
source=("https://github.com/xdobry/mysqltcl/archive/${pkgver}.tar.gz")
sha256sums=('fa16b9d991c0a2934a7a336102c5f83497c5eb05e631a5f45359ce293e92d3ad')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    [[ $CARCH == "x86_64" ]] && BIT="--enable-64bit"
    ./configure --prefix=/usr $BIT
    make || return 1
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    make DESTDIR="${pkgdir}" install
}
