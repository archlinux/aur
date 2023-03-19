# Maintainer: YidaozhanYa <yidaozhan_ya@outlook.com>
pkgname=mari0-ae
pkgver=13.1
pkgrel=1
pkgdesc="Mari0: Alesan99's Entities"
arch=('i386' 'x86_64')
url="https://github.com/alesan99/mari0_ae"
license=('custom')
depends=('love-0102-bin')
makedepends=('zip')
conflicts=('mari0')
source=("git+https://github.com/alesan99/mari0_ae.git")
sha256sums=("SKIP")

package() {
	cd "${srcdir}/mari0_ae"
	zip -r mari0-ae.love ./
    install -Dm0644 "${srcdir}/mari0_ae/mari0-ae.love" "${pkgdir}/usr/share/mari0/mari0-ae.love"
    mkdir -p "${pkgdir}/usr/share/applications"
    mkdir -p "${pkgdir}/usr/bin"
    install -Dm0644 "${srcdir}/mari0_ae/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
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
    install -Dm644 "${srcdir}/mari0_ae/graphics/icon.png" "${pkgdir}/usr/share/pixmaps/mari0-ae.png"
}
