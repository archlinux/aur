# Maintainer: Aggam Rahamim <agamclass@gmail.com>
# Shalom Hevre!

pkgname=alefbet
pkgver=1.1
pkgrel=2
pkgdesc="4 Hebrew fonts (at the moment): the commonly used \"David Libre\", the handwriting font \"Gveret Levin\", \"Varela_Round\" and \"open-sans\"."
arch=('any')
makedepends=('unzip')
license=('OFL')
source=(
    'https://github.com/meirsadan/david-libre/releases/download/v1.001/DavidLibre_TTF_v1.001.zip'
    'https://opensiddur.org/wp-content/uploads/fonts/GveretLevinAlefAlefAlef/GveretLevinAlefAlefAlef.zip'
    'https://פונטיםבעברית.co.il/wp-content/uploads/2019/01/open-sans.zip'
    'https://פונטיםבעברית.co.il/wp-content/uploads/2019/10/Varela_Round.zip'
)
sha256sums=(
    'a66515bcdcda5abab7a86d945a8d89077916837f1128e44610e74e88bc41bb3f'
    '5df0379f71c8e8b1ddf00a4bda6693fa4520c40ca1f3e157bccbdfad4fb03959'
    '42af7ad1db6c8b8b67e9648d220b6ed0e01d8295b60fe554c9e3b727b948addb'
    '3835a054825cb7da8d8b937becea1d7013a75715475f714fe295d2833a478887'
)
noextract=('GveretLevinAlefAlefAlef.zip')

package() {
    install -Dm644 OFL.txt "$pkgdir/usr/share/licenses/$pkgname/OFL"  # for David Libre, Gveret Levin, and Varela Round

    unzip Varela_Round.zip
    install -Dm644 *.ttf -t "${pkgdir}/usr/share/fonts/TTF/" #David Libre & Varela Round

    #Gveret Levin
    unzip GveretLevinAlefAlefAlef.zip -d gevretLevin/
    install -Dm644 gevretLevin/otf/GveretLevinAlefAlefAlef-Regular.otf -t "$pkgdir/usr/share/fonts/OTF/" 

    #open-sans
    unzip open-sans.zip
    install -Dm644 open-sans/*.ttf -t "${pkgdir}/usr/share/fonts/TTF/"
    install -Dm644 open-sans/LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/Apache"
}