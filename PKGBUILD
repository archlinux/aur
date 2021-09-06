# Maintainer: Ayatale  <ayatale@qq.com>

pkgname=arduino-beta-bin
_pkgname=arduino-beta
_pkgver=2.0.0-beta.11
pkgver=${_pkgver/-beta./b}
pkgrel=2
pkgdesc="A Major Rewrite, Sharing No Code With the Arduino IDE 1.x"
arch=('x86_64')
url="https://github.com/arduino/arduino-ide"
license=('AGPL3')
makedepends=('tar')
options=('!strip' 'emptydirs')
source=("https://github.com/arduino/arduino-ide/releases/download/${_pkgver}/arduino-ide_${_pkgver}_Linux_64bit.zip"
        "$_pkgname.desktop"
        "$_pkgname.png"
)
sha256sums=('a39875e76c9a4e307ce4c1c887b403b845870e3149ef0b07ec2264eeedaa6c85'
         '77e2cab9b6e79c97b1311b4100049dc1be5d186fd7ab054e7673c662aac27d34'
         '1568663b6ee0c7eb5b642ca1d131cc37b996992ce4b3b8b9e6f720280158fa1b')


package() {
    install -dm755 "$pkgdir/opt/"
	install -dm755 "$pkgdir/usr/bin/"
    install -Dm644 "$_pkgname.png" "$pkgdir/usr/share/pixmaps/$_pkgname.png"
    install -Dm644 "$_pkgname.desktop" "$pkgdir/usr/share/applications/$_pkgname.desktop"
    cp -r arduino-ide_${_pkgver}_Linux_64bit "$pkgdir/opt/$_pkgname"
    ln -s "/opt/$_pkgname/arduino-ide" "$pkgdir/usr/bin/arduino-beta"
}