# Maintainer: BadBoy <luckmelove2@gmail.com>

pkgname='dedsec-grub2-theme'
pkgver='1.0.0'
pkgrel='1'
pkgdesc='Beautiful dedsec grub2 themes'
arch=('any')
url='https://github.com/vandalsoul/dedsec-grub2-theme'
license=('GPL3')
install="${pkgname}".install

depends=('grub')

source=("git+${url}.git"
        "${pkgname}.install"
)
sha256sums=('SKIP'
            '36b026b2b42385bf13d27e29625698836fa623ec923f0262a47f5141619b1328'
)

package() {
    msg 'DedSec GRUB2 Theme'
    for ((a=0;a<${#Theme_name[@]};a++))
    do
        install -dm755 "${pkgdir}"/usr/share/grub/themes/"${pkgname}-${Theme_name[${a}]}"/icons

        install -Dm644 "${srcdir}/${pkgname}"/assets/backgrounds/"${Theme_name[${a}]}".png "${pkgdir}"/usr/share/grub/themes/"${pkgname}-${Theme_name[${a}]}"/background.png
        install -Dm644 "${srcdir}/${pkgname}"/dedsec/* "${pkgdir}"/usr/share/grub/themes/"${pkgname}-${Theme_name[${a}]}"
        install -Dm644 "${srcdir}/${pkgname}"/assets/icons/color/* "${pkgdir}"/usr/share/grub/themes/"${pkgname}-${Theme_name[${a}]}"/icons
    done
}

Theme_name=(
    'compact'
    'lovetrap'
    'stalker'
    'hype'
    'redskull'
    'mashup'
    'legion'
    'spam'
    'fuckery'
    'unite'
    'spyware'
    'reaper'
    'wrench'
    'strike'
    'brainwash'
    'wannacry'
    'firewall'
    'tremor'
)
