
# Contributor : abdus <nail@abdus.xyz>
# Maintainer: Jack Rubacha <rubacha.jack03@gmail.com>

pkgname=2048.c
_pkgname=2048
pkgver=109
pkgrel=1
pkgdesc="A terminal 2048 written in c"
arch=('any')
url="https://github.com/mevdschee/2048.c"
license=('MIT')
source=("https://raw.githubusercontent.com/mevdschee/2048.c/ddc2158f71c8f5831c5fac452e1a8ee555476027/2048.c"
        "https://raw.githubusercontent.com/mevdschee/2048.c/ddc2158f71c8f5831c5fac452e1a8ee555476027/Makefile"
        "https://raw.githubusercontent.com/mevdschee/2048.c/ddc2158f71c8f5831c5fac452e1a8ee555476027/debian_2048.png"
        "https://raw.githubusercontent.com/mevdschee/2048.c/ddc2158f71c8f5831c5fac452e1a8ee555476027/2048.desktop")
md5sums=('4d7e729490b577df6d22a0959a7423c4'
         '006de8d5fdd80f801619f1b4c98654e5'
         '1e0758b83dd3b6795fc3d978a641e0fe'
         '27ac4ab92e462772c4ae81a1c5f0cd81')

build() {
    cd "${srcdir}"
    make
}

check() {
    make test 
}

package() {
      make DESTDIR="$pkgdir/" install

      install -Dm644 "debian_$_pkgname.png" "${pkgdir}/usr/share/icons/hicolor/128x128/apps/$_pkgname.png"
      install -Dm644 "$_pkgname.desktop" "${pkgdir}/usr/share/applications/$_pkgname.desktop"
}

