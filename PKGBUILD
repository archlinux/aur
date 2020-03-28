#Maintainer: Adrian Freund <adrian@freund.io>

pkgbase=plymouth-themes-adi1090x-pack1
_themenames=('abstract_ring'
    'abstract_ring_alt'
    'alienware'
    'angular'
    'angular_alt'
    'black_hud'
    'blockchain'
    'circle'
    'circle_alt'
    'circle_flow'
    'circle_hud'
    'circuit'
    'colorful'
    'colorful_loop'
    'colorful_sliced'
    'connect'
    'cross_hud'
    'cubes'
    'cuts'
    'cuts_alt')
pkgname=() #initialized by loop at the bottom
pkgver=1
pkgrel=2
pkgdesc="The plymouth theme collection by adi1090x"
arch=('any')
url="https://github.com/adi1090x/plymouth-themes"
license=('GPL')
depends=('plymouth')

source=("git+https://github.com/adi1090x/plymouth-themes.git")
md5sums=('SKIP')

for themename in ${_themenames[*]}
do
    pkgname+=("plymouth-theme-${themename//_/-}")
    eval "
package_plymouth-theme-${themename//_/-}() {
    cd \$srcdir/plymouth-themes/pack_1/$themename
    mkdir -p \$pkgdir/usr/share/plymouth/themes/$themename
    find . -type f -exec install -Dm644 \"{}\" \"\${pkgdir}\"/usr/share/plymouth/themes/$themename/\"{}\" \\;
}
"
done
