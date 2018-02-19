# Maintainer: Daniel Playfair Cal <daniel__dot__playfair__dot__cal__at__gmail__dot__com>

pkgname=linux-intel-undervolt-tool
gitsha="a4e51fddd5b23b75bdcf638d3e09d78f94aed58a"
pkgver=1+${gitsha}
pkgrel=1
epoch=
pkdesc=""
arch=("i386" "x86_64")
url="https://github.com/hedgepigdaniel/linux-intel-undervolt-tool/"
groups=()
depends=("msr-tools" "python")
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install="undervolt-msr.install"
changelog=
source=("linux-intel-undervolt-tool-${gitsha}.tar.gz")
md5sums=('309d49ced8e8fc948ed07fa3c71f0f2f')


prepare () {
    tar -xvf ${pkgname}-${gitsha}.tar.gz
}

gitsha="a4e51fddd5b23b75bdcf638d3e09d78f94aed58a"
package () {
    install -D -m755 ${srcdir}/${pkgname}-${gitsha}/undervolt.py ${pkgdir}/usr/bin/undervolt
    install -D -m644 ${srcdir}/${pkgname}-${gitsha}/config.json ${pkgdir}/etc/undervolt.json
    install -D -m644 ${srcdir}/${pkgname}-${gitsha}/undervolt.service ${pkgdir}/usr/lib/systemd/system/undervolt.service
    install -D -m644 ${srcdir}/${pkgname}-${gitsha}/undervolt-msr.conf ${pkgdir}/etc/modules-load.d/undervolt-msr.conf
}

