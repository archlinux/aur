# Maintainer: Wren Baxter <aur [at] wren.dev>

pkgname=w08-star-db-astap
pkgver=2021.10.24
pkgrel=3
pkgdesc="Wide-field database (FOV>20 degrees) of stars up to magnitude 8"
arch=('any')
url="https://www.hnsky.org/astap.htm"
license=('LGPL3')
source=("w08.deb::https://downloads.sourceforge.net/project/astap-program/star_databases/w08_star_database_mag08_astap.deb")
sha256sums=('523131fbf448c547d42051df5d23aea7e92b0ca75484043abb35cd128da7beed')
optdepends=('astap-bin: binary GTk version'
    'astap-bin-qt5: binary Qt version'
    'astap: sourced Qt version'
    'astap-cli: CLI version'
    'hnsky-hg: planetarium program, hg-version'
    'hnsky-bin: planetarium program, bin-version')

# the deb is automatically unpacked in the automatic prepare() step, but the files we want are doubly archived
package() {
    tar xfv data.tar.xz -C "${pkgdir}"
    chmod 755 -R "${pkgdir}"
    chmod 644 "${pkgdir}"/opt/astap/*
}

