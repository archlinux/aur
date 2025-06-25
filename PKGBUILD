# Maintainer: suliman altassan <suliman.p2019@gmail.com>
# Maintainer:  skepr <skeprcontact@gmail.com>

# makepkg --printsrcinfo > .SRCINFO

pkgname=alif
pkgver=5.0.0
pkgrel=1
pkgdesc="The Alif Arabic Programming Language - لغة البرمجة العربية ألف"
arch=('x86_64' 'aarch64' 'armv7h')
url="https://www.aliflang.org/"
license=('GPL3')
depends=('boost')
source=("$pkgname-$pkgver"::"git+https://github.com/alifcommunity/Alif.git#branch=Alif5.0")
md5sums=('SKIP')
makedepends=('make' 'gcc')

build() {
    cd "$srcdir/$pkgname-$pkgver/linuxBuild"
    make
    make
}

package() {
    install -Dm755 "$srcdir/$pkgname-$pkgver/linuxBuild/build/alif" "$pkgdir/usr/bin/alif"
}
