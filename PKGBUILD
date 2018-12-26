# Maintainer: Ioan Moldovan <ioan@member.fsf.org>

pkgname=fissh
pkgver=1.0.1
pkgrel=2

pkgdesc='SSH authentication via Android Fingerprint scanning (Desktop part)'
url='https://git.iodev.science/ioan/FiSSH-Desktop'
arch=('x86_64')
license=('MIT')

makedepends=('git' 'qt5-base')

source=('git+https://git.iodev.science/ioan/FiSSH-Desktop')
install='fissh.install'
sha256sums=('SKIP')

build () {
    cd FiSSH-Desktop
    qmake
    make
}

package () {
    cd FiSSH-Desktop
    mkdir -p $pkgdir/opt/FiSSH
    mkdir -p $pkgdir/usr/bin
    mkdir -p $pkgdir/usr/share/licenses/fissh

    cp FiSSH $pkgdir/opt/FiSSH/FiSSH 
    chmod +x $pkgdir/opt/FiSSH/FiSSH
    cp fissh-script $pkgdir/usr/bin/fissh
    chmod +x $pkgdir/usr/bin/fissh
    cp LICENSE $pkgdir/usr/share/licenses/fissh/LICENSE
}
