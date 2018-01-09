# Maintainer: Thomas Jost <schnouki@schnouki.net>
pkgname=pia-bin
pkgver=1.0.7
pkgrel=1
pkgdesc="A tool that aims to help data controllers build and demonstrate compliance to the GDPR. Developped by the French CNIL."
arch=('x86_64')
url="https://www.cnil.fr/fr/node/23992"
license=('GPL')
depends=('alsa-lib' 'gconf' 'gtk2' 'nss' 'libxss' 'libxtst')
source=("https://github.com/LINCnil/pia-app/releases/download/${pkgver}/PIA-GNU_Linux-x64.zip"
        "pia-bin.png::https://raw.githubusercontent.com/LINCnil/pia-app/master/icons/default/icon%403x.png"
        "pia-bin.desktop"
        "pia-bin.sh")
md5sums=('031c13efe56ee432270459da4dadbd1c'
         'fb5d79b7c5adc7836a17657f06b8aadc'
         'd1476afe74a6a6c0b8270302cdb9752e'
         'c165f89dd2f9492157b53de094edc1d6')
sha256sums=('a3407d1fdb17f2dae6b8dceba76ba7b1aeb7d8877917b6c00dfd7473ee430c0f'
            '54dd3df8eb4ba01328d8c1fe4b28b4cae928c8cd2915571f65b9634da2cd5383'
            '13df9ed6626fe179ae34ee17b0039c696a4a579642e013d8b11389b140b27976'
            '3e07f80419a8dd3d49cf9587a6dc23bc0d1fff224a149e9c5f15cce8f063dca7')

prepare() {
    cd "$srcdir/PIA-GNU_Linux-x64"
    rm -f ".DS_Store"
}

package() {
    cd "$srcdir"
    mkdir -p "$pkgdir/opt"
    cp -r "PIA-GNU_Linux-x64" "$pkgdir/opt/pia"

    install -Dm644 pia-bin.desktop "$pkgdir/usr/share/applications/pia-bin.desktop"
    install -Dm644 pia-bin.png "$pkgdir/usr/share/pixmaps/pia-bin.png"
    install -Dm755 pia-bin.sh "$pkgdir/usr/bin/pia-bin"
}
