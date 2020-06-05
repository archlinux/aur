# Maintainer: cyka3702 <swc.rainier@gmail.com>
# Contributor: paperbenni <paperbenni@gmail.com>
_pkgname=instantutils
pkgname=$_pkgname
pkgver=202006050951
pkgrel=1
pkgdesc="core utilities for instantOS"
url="https://github.com/instantOS/instantos"
arch=('any')
license=('MIT')
depends=('sh' 'acpi' 'wget' 'feh' 'dash' 'xdotool')
makedepends=('git')
provides=(instantutils)
conflicts=(instantutils)
source=("$_pkgname::git+https://github.com/instantOS/instantOS.git")

sha256sums=('SKIP')

pkgver() {
    cd $_pkgname
    echo "$(date '+%Y%m%d%H%M')"
}

prepare() {
    cd $_pkgname
    echo "no prepare"
}

build() {
    cd $_pkgname
    echo "no build"
}

package() {
    cd $_pkgname
    mkdir -p ${pkgdir}/usr/bin
    mkdir -p ${pkgdir}/usr/share/instantutils
    mkdir -p ${pkgdir}/etc/X11/xorg.conf.d

    chmod +x *.sh
    mv ./autostart.sh ${pkgdir}/usr/bin/instantautostart
    mv ./status.sh ${pkgdir}/usr/bin/instantstatus
    mv ./monitor.sh ${pkgdir}/usr/bin/instantmonitor

    mv ./instantutils.sh ${pkgdir}/usr/bin/instantutils
    mv ./installinstantos.sh ${pkgdir}/usr/bin/installinstantos

    mv *.sh ${pkgdir}/usr/share/instantutils/

    mkdir -p "$pkgdir/usr/share/applications/"
    mv ./desktop/*.desktop "$pkgdir/usr/share/applications/"

    cd programs
    chmod +x ./*
    mv ./* ${pkgdir}/usr/bin/
    cd ..

    cd xorg
    mv ./* ${pkgdir}/etc/X11/xorg.conf.d/

}
