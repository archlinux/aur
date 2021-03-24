# Maintainer: Aggam Rahamim <agamclass@gmail.com>
# Shalom Hevre!

pkgname=alefbet
pkgver=1.0
pkgrel=1
pkgdesc="2 Hebrew fonts (at the moment): the commonly used \"David Libre\", and the handwriting font \"Gveret Levin\"."
arch=('any')
license=('OFL')
source=(
    'https://github.com/meirsadan/david-libre/releases/download/v1.001/DavidLibre_TTF_v1.001.zip'
    'https://opensiddur.org/wp-content/uploads/fonts/GveretLevinAlefAlefAlef/GveretLevinAlefAlefAlef.zip'
)
sha256sums=(
    'a66515bcdcda5abab7a86d945a8d89077916837f1128e44610e74e88bc41bb3f'
    '5df0379f71c8e8b1ddf00a4bda6693fa4520c40ca1f3e157bccbdfad4fb03959'
)
noextract=(
    'GveretLevinAlefAlefAlef.zip'
)
package() {

    install -Dm644 OFL.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE" # they all use the OFL

    #David Libre
    install -Dm644 *.ttf -t "${pkgdir}/usr/share/fonts/TTF/"

    #Gveret Levin
    unzip GveretLevinAlefAlefAlef.zip -d gevretLevin/
    install -Dm644 gevretLevin/otf/GveretLevinAlefAlefAlef-Regular.otf -t "$pkgdir/usr/share/fonts/OTF/" 

}