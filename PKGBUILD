# Maintainer: YidaozhanYa <yidaozhan_ya@outlook.com>
pkgname=mari0-ae
pkgver=0.10.0
pkgrel=13
pkgdesc="Mari0: Alesan99's Entities"
arch=('i386' 'x86_64')
url="https://github.com/alesan99/mari0_ae"
license=('custom')
depends=('love-0102-bin')
conflicts=('mari0')
source=("alesan99s_entities_0-10-0_13_linux.zip::https://www.dropbox.com/s/zu5goz91id95wn6/alesan99s_entities_0-10-0_13_linux.zip?dl=1"
        "https://github.com/alesan99/mari0_ae/raw/master/LICENSE.txt"
        "mari0-ae.png::https://github.com/alesan99/mari0_ae/raw/master/graphics/icon.png")
sha256sums=('d80e5e7f64f852bf3441db432253eec9b2071d66d4d187b3ed296890a3aa63de'
'3fe0d54c592d1778a60779a0b995b798437570ab2ed3ebc380027e0da2760c0b'
'6729f42d496bd9ef3876487bca4ef99e8565166bdae989b44180357e99789440')

package() {
	#cd "${srcdir}/alesan99s_entities_0-10-0_13"
    install -Dm0644 "${srcdir}/alesan99s_entities_0-10-0_13/alesan99s_entities_0-10-0_13.love" "${pkgdir}/usr/share/mari0/mari0-ae.love"
    mkdir -p "${pkgdir}/usr/share/applications"
    mkdir -p "${pkgdir}/usr/bin"
    install -Dm0644 "${srcdir}/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    echo "#!/bin/bash
    love /usr/share/mari0/mari0-ae.love" > "${pkgdir}/usr/bin/mari0-ae"
    chmod 755 "${pkgdir}/usr/bin/mari0-ae"
    echo "[Desktop Entry]
    Version=0.10.0-13
    Type=Application
    Icon=mari0-ae
    Exec=mari0-ae
    Terminal=false
    StartupNotify=false
    Name=Mari0 AE
    GenericName=Mari0: Alesan99's Entities
    Comment=Mari0: Alesan99's Entities
    Categories=Game;ArcadeGame;" > "${pkgdir}/usr/share/applications/mari0-ae.desktop"
    chmod 755 "${pkgdir}/usr/share/applications/mari0-ae.desktop"
    install -Dm644 "${srcdir}/mari0-ae.png" "${pkgdir}/usr/share/pixmaps/mari0-ae.png"
}
