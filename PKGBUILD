# Maintainer: Nadir Boussoukaia <boussou@gmail.com>

# mdcharm is currently unmaintained. See https://github.com/zhangshine/MdCharm/issues/4
# here is a build that will install the last binary from gthub

pkgname=mdcharm-bin
pkgver=1.2.0
pkgrel=1
pkgdesc="A wiki editor, currently it supports markdown(markdown extra) and Multi-Markdown."
arch=('i686' 'x86_64')
url="http://www.mdcharm.com/"
license=('custom')
makedepends=('tar binutils xz')

prepare() {

    wget https://github.com/zhangshine/MdCharm/releases/download/1.2.0/mdcharm_1.2_amd64.deb
    ar x mdcharm_1.2_amd64.deb
    tar xf data.tar.xz

}

package() {

    install -Dm755 usr/bin/mdcharm $pkgdir/usr/bin/mdcharm
    install -Dm644 usr/share/applications/mdcharm.desktop $pkgdir/usr/share/applications/mdcharm.desktop
    install -d -Dm644 usr/share/mdcharm $pkgdir/usr/share/mdcharm


} 
