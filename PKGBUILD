# Maintainer: Manoel Brunnen <manoel.brunnen@gmail.com>

pkgname=powerline-patched-fonts
pkgver=1.0.0
pkgrel=0
pkgdesc="Various powerline patched TTF fonts"
arch=('any')
url="https://github.com/powerline/fonts"
_raw_url="https://raw.githubusercontent.com/ryanoasis/nerd-fonts/master/patched-fonts/DejaVuSansMono"
license=('MIT')
depends=('fontconfig' 'xorg-font-utils')
install="${pkgname}.install"
source=(
'https://github.com/powerline/fonts/archive/master.zip'
)
md5sums=('f3ba7f1359b3cb485eed5b285e626c30')

package() {
    install -dm0755 ${pkgdir}/usr/share/fonts/OTF
    install -dm0755 ${pkgdir}/usr/share/fonts/TTF

    find_otf="find \"$srcdir/fonts-master\" \( -name '*.otf' \) -type f -print0"
    find_ttf="find \"$srcdir/fonts-master\" \( -name '*.ttf' \) -type f -print0"
    eval $find_otf | xargs -0 -n1 -I % install -Dm0644 "%" "${pkgdir}/usr/share/fonts/OTF"
    eval $find_ttf | xargs -0 -n1 -I % install -Dm0644 "%" "${pkgdir}/usr/share/fonts/TTF"
}
