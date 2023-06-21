# Maintainer: Rabin Adhikari <rabin.adk1@gmail.com>

pkgname=transcreen
pkgver=1.1.12
pkgrel=1
epoch=0
pkgdesc='Multi-screen interactive software for interaction between smart phones and smart TVs.'
arch=('x86_64')
url=https://www.transcreen.pro
license=('unknown')
options=(!strip)
source=("https://transcreen.app/ubuntu/x86/Transcreen_${pkgver}_amd64.deb")
sha256sums=('9cf6bbd15435be8143c5b03bc3df069db4abaa7cb3420ea0fd74548f34979802')

prepare() {
    bsdtar -xf data.tar.xz
}

package() {
    cp -a opt usr "$pkgdir"

    mkdir "$pkgdir/usr/bin"
    ln -s "$pkgdir/opt/Transcreen/Transcreen" "$pkgdir/usr/bin/Transcreen"
}
