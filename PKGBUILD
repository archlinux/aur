# Maintainer: Wren Baxter <aur [at] wren.dev>

pkgname=h17-star-db-astap
pkgver=2021.1.5
pkgrel=1
pkgdesc="Database of 105 million stars up to BP-magnitude 17, for use with ASTAP"
arch=('any')
url="https://www.hnsky.org/astap.htm"
license=('LGPL3')
source=("h17.deb::https://sourceforge.net/projects/astap-program/files/star_databases/h17_star_database_mag17_astap.deb/download")
sha256sums=('64c9d4715cf807ca8763bd0e16c60ae335c2a66e86dd78e7a81f1ca20da3bd51')
depends=('astap')

# the deb is automatically unpacked in the automatic prepare() step, but the files we want are doubly archived
package() {
    tar xpfv data.tar.xz -C "${pkgdir}"
    chmod 755 -R "${pkgdir}"
}

