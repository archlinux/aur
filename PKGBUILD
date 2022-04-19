# Maintainer: Wren Baxter <aur [at] wren.dev>

pkgname=h18-star-db-astap
pkgver=2021.1.3
pkgrel=1
pkgdesc="Database of 208 million stars up to BP-magnitude 18, for use with ASTAP"
arch=('any')
url="https://www.hnsky.org/astap.htm"
license=('LGPL3')
source=("h18.deb::https://downloads.sourceforge.net/project/astap-program/star_databases/h18_star_database_mag18_astap.deb")
sha256sums=('98e659aba0d8e09d816fa6e4ef40620a1f681f9373ae4ba1bc3c278c8bebd5a5')
depends=('astap')

# the deb is automatically unpacked in the automatic prepare() step, but the files we want are doubly archived
package() {
    tar xfv data.tar.xz -C "${pkgdir}"
    chmod 755 -R "${pkgdir}" 
}

