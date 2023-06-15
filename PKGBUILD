pkgname=d50-star-db-astap
pkgver=2023.03.18
pkgrel=3
pkgdesc="D50 star database for 10>FOV>0.2 degrees. Size 900 Mb"
arch=('any')
url="https://www.hnsky.org/astap.htm"
license=('LGPL3')
source=("d50_star_database.deb::https://downloads.sourceforge.net/project/astap-program/star_databases/d50_star_database.deb")
sha256sums=('0bb0a874a0c21a35c5bc12c12948124ee757d7611077f0914b86b4d496fa383c')
depends=()
replaces=('h18-star-db-astap')
optdepends=('astap-bin: binary GTk version'
	    'astap-bin-qt5: binary Qt version'
	    'astap: sourced Qt version'
	    'astap-cli: CLI version'
    	    'hnsky-hg: planetarium program, hg-version'
	    'hnsky-bin: planetarium program, bin-version')


package() {
    tar xfv data.tar.xz -C "${pkgdir}"
    chmod 755 -R "${pkgdir}"
    chmod 644 "${pkgdir}"/opt/astap/*
}
