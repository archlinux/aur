# Maintainer: Jasper Young <jasper.c.young@gmail.com>
pkgname=jasper-i3blocks-blocklets-git
pkgver=2022_12_28.96a82ea2036c9f246389f4c5eb42bc35c217660d
pkgrel=1
epoch=1
pkgdesc="Jasper's blocklets for i3blocks"
arch=('x86_64')
url="https://github.com/jasper1378/i3blocks-blocklets"
license=('MIT')
groups=('i3')
depends=('pulseaudio')
makedepends=('git')
#checkdepends=()
#optdepends=()
#provides=()
#conflicts=()
#replaces=()
#backup=()
#options=()
#install=
#changelog=
source=("git+$url.git")
#noextract=()
md5sums=('SKIP')
#validpgpkeys=()

#prepare() {
#}

build() {
    cd i3blocks-blocklets
    ./build_all.sh
}

#check() {
#}

package() {
    cd i3blocks-blocklets

    mkdir -p "$pkgdir/usr/lib/$pkgname/"
    cp bin/* "$pkgdir/usr/lib/$pkgname/"

    mkdir -p "$pkgdir/usr/share/licenses/$pkgname/"
    cp LICENSE "$pkgdir/usr/share/licenses/$pkgname/"

    mkdir -p "$pkgdir/usr/share/doc/$pkgname/"
    cp -r doc/* "$pkgdir/usr/share/doc/$pkgname/"
}
