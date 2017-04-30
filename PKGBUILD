# Maintainer: Mike Krüger <mikekrueger81[at]gmail.com>

pkgname=vibrancy-full-dark-blue
pkgver=2.7
pkgrel=1
pkgdesc="Modern, clean and customizable flat icon theme [Full-Dark-Blue only version!]"
arch=('any')
makedepends=('binutils' 'tar')
url="http://www.ravefinity.com/p/vibrancy-colors-gtk-icon-theme.html"
license=('CCPL:by-sa' 'GPL2')
options=('!strip')
replaces=('vibrancy-colors')
conflicts=('vibrancy-blue')
source=("https://launchpad.net/~ravefinity-project/+archive/ubuntu/ppa/+files/vibrancy-colors_${pkgver}~xenial~Noobslab.com_all.deb")

sha256sums=('f02c514834e5ea9b8176c5b767eb6d1693123fd8403885ce61fa253b1623a204')

prepare() {
    cd ${srcdir}
    ar vx vibrancy-colors_${pkgver}~xenial~Noobslab.com_all.deb
    tar -xf data.tar.xz

    rm -rf ${srcdir}/usr/share/icons/Vibrancy-Dark-*
    rm -rf ${srcdir}/usr/share/icons/Vibrancy-Light-*
    rm -rf ${srcdir}/usr/share/icons/Vibrancy-NonMono-*
    rm -rf ${srcdir}/usr/share/icons/Vibrancy-Colors-NonMono-*
    rm -rf ${srcdir}/usr/share/icons/Vibrancy-Colors-Light
    rm -rf ${srcdir}/usr/share/icons/Vibrancy-Full-Dark-Aqua
    rm -rf ${srcdir}/usr/share/icons/Vibrancy-Full-Dark-Brown
    rm -rf ${srcdir}/usr/share/icons/Vibrancy-Full-Dark-Graphite
    rm -rf ${srcdir}/usr/share/icons/Vibrancy-Full-Dark-Green
    rm -rf ${srcdir}/usr/share/icons/Vibrancy-Full-Dark-Green-Viva
    rm -rf ${srcdir}/usr/share/icons/Vibrancy-Full-Dark-Orange
    rm -rf ${srcdir}/usr/share/icons/Vibrancy-Full-Dark-Pink
    rm -rf ${srcdir}/usr/share/icons/Vibrancy-Full-Dark-Purple
    rm -rf ${srcdir}/usr/share/icons/Vibrancy-Full-Dark-Red
    rm -rf ${srcdir}/usr/share/icons/Vibrancy-Full-Dark-Teal
    rm -rf ${srcdir}/usr/share/icons/Vibrancy-Full-Dark-Yellow
}


package() {
  install -d $pkgdir/usr/share/icons
  mv ${srcdir}/usr/share/icons/* $pkgdir/usr/share/icons/
}
