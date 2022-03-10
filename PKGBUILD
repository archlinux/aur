# Contributor: Andrey Alekseev <andrey.android7890 at gmail dot com>
pkgname="otf-daddytimemono-git"
pkgver=1.2.2.r6.g042eb9f
pkgrel=1
pkgdesc="A monospaced font for programmers and other terminal groupies"
arch=('any')
url="https://github.com/BourgeoisBear/DaddyTimeMono"
license=('custom:OFL')
depends=('fontconfig')
makedepends=('git' 'fontforge')
provides=('otf-daddytimemono')
source=(git+https://github.com/BourgeoisBear/DaddyTimeMono.git)
md5sums=('SKIP')

pkgver(){
    cd $srcdir/DaddyTimeMono
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}         
         
build(){
    cd $srcdir/DaddyTimeMono
    . make.sh
}
    
package(){
    cd $srcdir/DaddyTimeMono
    install -dm 755 "${pkgdir}/usr/share/fonts/TTF"
    install -m 644 build/DaddyTimeMono.otf "${pkgdir}/usr/share/fonts/TTF/"
    install -Dm644 LICENSE.md "${pkgdir}/usr/share/licenses/DaddyTimeMono/LICENSE"
}
