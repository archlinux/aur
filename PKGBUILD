# Maintainer: whriedplanck <fungdaat31[at]outlook.com>
# Contributor: evansan

pkgname=fcitx5-dark-default
pkgver=0.0.0.20200619
_commit=9ec539e6d2be5415abf6224de6d74775d59abfb6
pkgrel=1
pkgdesc="Dark theme based on the default fcitx5 theme"
arch=('any')
url="https://github.com/evansan/fcitx5-dark"
license=('MIT')
source=("$url/archive/$_commit/$pkgname-$_commit.tar.gz")
md5sums=('aeb8ae759febc693384a0a139aea4e25')

package() {
    _variant_name=fcitx5-dark
    cd $_variant_name-$_commit
    #Modify theme.conf
    sed -i 's/Per defecte/Per defecte(Negre)/g' theme.conf
    sed -i 's/\[de\]=Standard/\[de\]=Standard(Schwarz)/g' theme.conf
    sed -i 's/\[da\]=Standard/\[da\]=Standard(Sort)/g' theme.conf
    sed -i 's/既定/既定(黒)/g' theme.conf
    sed -i 's/기본값/기본값(검정색)/g' theme.conf
    sed -i 's/По умолчанию/По умолчанию(черный)/g' theme.conf
    sed -i 's/默认/默认(黑)/g' theme.conf
    sed -i 's/預設/預設(黑)/g' theme.conf
    sed -i 's/Default/Default(Dark)/g' theme.conf
    #Installation
    install -Dm644 arrow.png "$pkgdir"/usr/share/fcitx5/themes/$_variant_name/arrow.png
    install -Dm644 highlight.png "$pkgdir"/usr/share/fcitx5/themes/$_variant_name/highlight.png
    install -Dm644 panel.png "$pkgdir"/usr/share/fcitx5/themes/$_variant_name/panel.png
    install -Dm644 radio.png "$pkgdir"/usr/share/fcitx5/themes/$_variant_name/radio.png
    install -Dm644 theme.conf "$pkgdir"/usr/share/fcitx5/themes/$_variant_name/theme.conf
    install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
