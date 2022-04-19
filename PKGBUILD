# Maintainer: Wren Baxter <aur [at] wren.dev>

pkgname=v17-photometry-color-db-astap
pkgver=2020.12.20
pkgrel=1
pkgdesc="Color database of 105 million stars up to Johnson V-magnitude 17, for use with ASTAP"
arch=('any')
url="https://www.hnsky.org/astap.htm"
license=('LGPL3')
source=("v17.deb::https://downloads.sourceforge.net/project/astap-program/star_databases/v17_star_database_mag17_colour_astap.deb")
sha256sums=('b2f2e70c4a5578c13ac1e06589d614598759661608753d8f228096ce63bfaee1')
depends=('astap')

# the deb is automatically unpacked in the automatic prepare() step, but the files we want are doubly archived
package() {
    tar xpfv data.tar.xz -C "${pkgdir}"
    chmod 755 -R "${pkgdir}"
}

