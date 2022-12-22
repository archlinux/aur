# Maintainer: Mark Stenglein <aur@markstenglein.com>
name=picosynth
pkgname=$name-bin
pkgver=1.1
pkgrel=2
pkgdesc="picoSYNTH is a playful tool where you by connecting various pieces
of equipment to each other can create anything from short loops to chippy
beats."
arch=("x86_64")
url="https://johanpeitz.itch.io/picosynth"
license=('custom:commercial')
makedepends=()
depends=('sdl2')
conflicts=("$name")
zipname=${name}-${pkgver}_linux
desktopfile=io.itch.johanpeitz.picoSYNTH.desktop
source=("local://$zipname.zip"
        "$desktopfile")
sha256sums=('6092a4f3f7feb599e0d5f7cc6308c8d021cf2b320420a36c9850b426aeb920cb'
            'd9eb0daa8a0919720ed7f93313df7a3183021404f0d3a6a06c8e8f38fda0d664')
options=('!purge')
picosrcdir=$name-${pkgver}_linux

package() {
    install -Dm755 $picosrcdir/$name-$pkgver $pkgdir/opt/$name/$name
    install -Dm644 $picosrcdir/data.pod $pkgdir/opt/$name/data.pod
    install -Dm644 $picosrcdir/$name-$pkgver.png $pkgdir/usr/share/pixmaps/$name.png
    install -Dm644 $desktopfile $pkgdir/usr/share/applications/$desktopfile
    install -Dm644 $picosrcdir/legal.txt $pkgdir/usr/share/licenses/$pkgname/legal.txt
}
