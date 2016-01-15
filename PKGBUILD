# Maintainer: reflexing <reflexing@reflexing.ru>
# Contributor: Alexander Zubkov <green@msu.ru>
# Contributor: nsf
#
# Package is maintained on GitHub: https://github.com/reflexing/ttf-paratype

pkgname=ttf-paratype
pkgver=20140730
pkgrel=2
pkgdesc='Font family by ParaType: sans, serif, mono, extended cyrillic and latin, OFL license'
arch=('any')
url='http://www.paratype.com/public/'
license=('custom:OFL')
depends=('fontconfig' 'xorg-fonts-encodings' 'xorg-mkfontscale' 'xorg-mkfontdir')
conflicts=('ttf-pt-mono' 'ttf-pt-sans' 'ttf-pt-serif')
provides=('ttf-font')
install="$pkgname.install"
source=(PTSansOFL-"$pkgver".zip::http://www.paratype.ru/uni/public/PTSansOFL.zip
        PTSerifOFL-"$pkgver".zip::http://www.paratype.ru/uni/public/PTSerifOFL.zip
        PTMonoOFL-"$pkgver".zip::http://www.paratype.ru/uni/public/PTMonoOFL.zip
        "$pkgname".conf)

package() {
    # Prepare destination directories
    install -dm755 "$pkgdir/usr/share/fonts/TTF" "$pkgdir/etc/fonts/conf.avail"

    # Install fonts
    install -m644 *.ttf "$pkgdir/usr/share/fonts/TTF"

    # Install fontconfig customization file
    install -Dm644 "$pkgname".conf "$pkgdir/etc/fonts/conf.avail/49-$pkgname.conf"

    # Install license
    install -Dm644 PTSSM_OFL.txt -t "$pkgdir/usr/share/licenses/$pkgname"
}

md5sums=('e5b99133d3b72cd35400b5aa810ad0ee'
         '4dd07baa86fd30977cdfabd82bf2ad1d'
         '1c6d5c30fca24130b2888b9427a75134'
         '1c02ad07bd1be3a9915d39bb864ad4dd')
