# Maintainer: Ayatale  <ayatale@qq.com>

pkgname=arduino-beta-bin
_pkgname=arduino-beta
pkgver=2.0.0b5
pkgrel=1
pkgdesc="A Major Rewrite, Sharing No Code With the Arduino IDE 1.x"
arch=('x86_64')
url="https://github.com/arduino/arduino-ide"
license=('AGPL3')
makedepends=('tar')
options=('!strip' 'emptydirs')
source=("$_pkgname-$pkgver.zip::https://github.com/arduino/arduino-ide/releases/download/2.0.0-beta.5/arduino-ide_2.0.0-beta.5_Linux_64bit.zip"
        "$_pkgname.desktop"
        "$_pkgname.png"
        "$_pkgname"
)
md5sums=('cded795e3f1bd63e8ff79f2cbe015a04'
         'fdd24c05ca7faed01893ebd5a732351d'
         'bbc2e7c5c6d340a3c6d1c56f0ef2733c'
         '34f9f2dc00f844cd6b40e6d3ee9ec1ed')


package() {
    install -Dm755 "$_pkgname" "${pkgdir}/usr/bin/$_pkgname"
    install -Dm644 "$_pkgname.desktop" "${pkgdir}/usr/share/applications/$_pkgname.desktop"
    install -Dm644 "$_pkgname.png" "$pkgdir/usr/share/icons/hicolor/512x512/apps/$_pkgname.png"
    mkdir "${pkgdir}/opt/"
    cp -r arduino-ide_2.0.0-beta.5_Linux_64bit "${pkgdir}/opt/$_pkgname"
}