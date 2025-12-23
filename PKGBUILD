# Maintainer: Wren Baxter <aur [at] wren.dev>

pkgname=hyperleda-galaxy-db-astap
pkgver=2024.6.9
pkgrel=1
pkgdesc="Database of 1.3m galaxies and 171k other non-star objects. Size 25MB"
arch=('any')
url="http://leda.univ-lyon1.fr/"
license=('LGPL3')
source=("hyperleda.deb::https://downloads.sourceforge.net/project/astap-program/star_databases/hyperleda.deb")
md5sums=('def14239e920159338f18e16fd32f5ed')
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

