
# Contributor : abdus <nail@abdus.xyz>
# Maintainer: Jack Rubacha <rubacha.jack03@gmail.com>

pkgname=2048.c
_pkgname=2048
pkgver=110
pkgrel=1
pkgdesc="A terminal 2048 written in c"
arch=('any')
url="https://github.com/mevdschee/2048.c"
license=('MIT')
_commit=6c04517bb59c28f3831585da338f021bc2ea86d6
source=("https://raw.githubusercontent.com/mevdschee/2048.c/$_commit/2048.c"
        "https://raw.githubusercontent.com/mevdschee/2048.c/$_commit/Makefile"
        "https://raw.githubusercontent.com/mevdschee/2048.c/$_commit/debian_2048.png"
        "https://raw.githubusercontent.com/mevdschee/2048.c/$_commit/2048.desktop"
        "https://raw.githubusercontent.com/mevdschee/2048.c/$_commit/LICENSE")
sha256sums=('97d5588606bed67e9a950831d097c003acc977deb9e982b73b27643dcf6e9cd3'
         'a6b1fbfbe3face5004e6c9aae5139976c4fff7f57175642ea2f9ee75e8ee033c'
         'c4c2178516e724494d561a5b71e870b8d472e152a8b9b1928cffdb8a73186c63'
         'ca26f7cb5c843ff3bf4701b6f7a1187f6ae412fceb8be295eadbdf43ad2db053'
	 '12379e99b6f508a478a217b9e832d473a632e5714eb247e60d3eb228284197e4')

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
      install -Dm644 -t "${pkgdir}/usr/share/licenses/${_pkgname}" 'LICENSE'	
}

