# Maintainer: Wren Baxter <aur [at] wren.dev>

pkgname=d80-star-db-astap
pkgver=2023.09.29
pkgrel=1
pkgdesc="D80 star database for 10>FOV>0.15 degrees. Size 1.2GB"
arch=('any')
url="https://www.hnsky.org/astap.htm"
license=('LGPL3')
source=('d80.deb::https://sourceforge.net/projects/astap-program/files/star_databases/d80_star_database.deb/download')
md5sums=('1d0683cbc0d0330df03378fab9d899bf')
optdepends=('astap-bin: binary GTk version'
    'astap-bin-qt5: binary Qt version'
    'astap: sourced Qt version'
    'astap-cli: CLI version'
    'hnsky-hg: planetarium program, hg-version'
    'hnsky-bin: planetarium program, bin-version')

prepare() {
    tar -xf data.tar.xz
}

package() {
    mkdir -p "${pkgdir}"/opt
    cp -r "${srcdir}/opt/astap" "${pkgdir}"/opt
    chmod 755 -R "${pkgdir}"
    chmod 644 "${pkgdir}"/opt/astap/*
}

