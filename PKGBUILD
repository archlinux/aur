# Maintainer: Steffen Fritz <aur AT fritz DOT wtf>
pkgname=pacaudit
pkgver=0.1
pkgrel=2
pkgdesc="This package audits installed packages against known vulnerabilities. Use after pacman -Syu."
arch=('i686' 'x86_64')
url="https://github.com/steffenfritz/pacaudit"
license=('GPL3')
depends=('glibc')
makedepends=('go>=1.6')
options=('!strip')
source=("https://github.com/steffenfritz/pacaudit/archive/master.zip" "https://fritz.wtf/master.zip.asc")

build() {
    cd pacaudit-master
    go build -o pacaudit -ldflags "-s -w"
}

package() {
    mkdir -p $pkgdir/usr/bin
    cd pacaudit-master
    install -m744 $srcdir/pacaudit-master/pacaudit $pkgdir/usr/bin/pacaudit

}
validpgpkeys=('7328F6E376924E4EE266381D3D9C808E038A615C')
sha256sums=('bd6aa2105e34b602ba82a17d0ccff51e8bb65132684b4f8e3c6ab055f4a3ea01'
'78823ee5ea2b87f8f5548f44e8fec85384ab142cb69814ea653beb60cfcb24d3')
