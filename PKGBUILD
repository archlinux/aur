# Maintainer: Andrew Stubbs <andrew.stubbs@gmail.com>
pkgname=etcher
realver=1.0.0-beta.8
pkgver=${realver//-/_}
pkgrel=1
pkgdesc="Burn images to SD cards & USB drives, safe & easy"
arch=('i686' 'x86_64')
url="http://www.etcher.io/"
license=('apache')
source=("etcher"
	"Etcher.desktop"
	"etcher.png")
source_i686=("https://resin-production-downloads.s3.amazonaws.com/etcher/$realver/Etcher-linux-x86.AppImage")
source_x86_64=("https://resin-production-downloads.s3.amazonaws.com/etcher/$realver/Etcher-linux-x64.AppImage")
noextract=("Etcher-linux-x64.AppImage")
options=("!strip")
md5sums=('8eff5560a3a4cae73698d7eda2d71577'
         '89f5cf77f164510b1f980820aaa4cf91'
         '7bd70ef05c6293e36938240be2558091')
md5sums_i686=('1118cf594b3eaee866ed246a8c0f38b5')
md5sums_x86_64=('7f1da299a708d27d7f6b77cc1900ed6d')

package() {
    local a=x86
    [ "$pkgarch" == "x86_64" ] && a=x64

    install -D "$srcdir/etcher" "$pkgdir/usr/bin/etcher"
    install -D "$srcdir/Etcher-linux-$a.AppImage" "$pkgdir/usr/share/etcher/Etcher-linux-$a.AppImage"
    install --mode=644 -D "$srcdir/etcher.png" "$pkgdir/usr/share/etcher/etcher.png"
    install -D "$srcdir/Etcher.desktop" "$pkgdir/usr/share/applications/Etcher.desktop"
}
