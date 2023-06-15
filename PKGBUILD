pkgname=astap
pkgver=2023.06.13
pkgrel=1
pkgdesc="Astrometric (plate) solver, stacking of images, photometry and FITS viewer (build from source). Qt5 version."
arch=('x86_64')
url="http://www.hnsky.org/astap.htm"
license=('GPL')
makedepends=('lazarus')
depends=('qt5-base' 'qt5-x11extras' 'qt5pas')
source=("https://www.hnsky.org/astap_source.zip")
sha256sums=('0985a17c0adaf50df8c746b9b2c0cf8164aa8355baab27e8434fbc9ebe9edff5')
optdepends=('hyperleda-galaxy-db-astap: 25MB database of 1.3m galaxies and 171k other non-star objects'
            'w08-star-db-astap: 250KB database of stars up to magnitude 8, reliable above 20° FOV'
	    'd05-star-db-astap: 100MB database of 500 stars per square degree, reliable with 0.6-10° FOV'
	    'd20-star-db-astap: 400MB database of 2000 stars per square degree, reliable with 0.3-10° FOV'
            'd50-star-db-astap: 900MB database of 5000 stars per square degree, reliable with 0.2-10° FOV')

build() {
    cd $srcdir/
    lazbuild -B astap_linux_qt5.lpi
}

package() {
    mkdir -p "${pkgdir}/opt/${pkgname}"
    cp -r "${srcdir}/${pkgname}" "${pkgdir}/opt/${pkgname}/${pkgname}"
}
