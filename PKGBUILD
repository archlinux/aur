# Maintainer: Martin Sand <martin.sand.dev@gmail.com>

pkgname=ttf-kids
pkgver=001.003
pkgrel=1
pkgdesc="TrueType Font Kids"
url="https://fonts2u.com/kids.font"
arch=('any')
license=('free')
depends=('fontconfig' 'xorg-fonts-encodings' 'xorg-font-utils')
source=('http://ttfonts.net/sfonts/2/21594_Kids.ttf')
provides=('ttf-font')
md5sums=('d51d8a2663404cc525e9ace46915a88a')

package() {
	cd $srcdir

        for i in *.ttf; do
          local destname="$(echo "$i" | sed -E 's|-[[:digit:].]+\.ttf$|.ttf|')"
          install -Dm 644 "$i" "${pkgdir}/usr/share/fonts/TTF/${destname}"
        done
}
