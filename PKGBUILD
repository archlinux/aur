pkgname=v50-star-db-astap
pkgver=2023.03.26
pkgrel=2
pkgdesc="It contains the calculated Johnson-V magnitude and colour information (GBp-GRp) for star annotations used in photometry. Size 1.0 GB"
arch=('any')
url="https://www.hnsky.org/astap.htm"
license=('LGPL3')
source=("v50_star_database.deb::https://downloads.sourceforge.net/project/astap-program/star_databases/v50_star_database.deb")
md5sums=('015a3941fa8a777d4f08832bc626778c')
depends=()
replaces=('v17-color-photometry-db-astap')
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
