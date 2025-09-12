# Maintainer: Zhang Hua <zhanghuadedn at gmail dot com>
# Contributor: Coelacanthus <coelacanthus@outlook.com.com>
# Contributor: yjun <jerrysteve1101@gmail.com>

pkgname='hentaiathome'
pkgver=1.6.4
pkgrel=3
pkgdesc="An open-source Peer-2-Peer gallery distribution system which reduces the load on the E-Hentai Galleries"
arch=('any')
url="https://ehwiki.org/wiki/Hentai@Home"
license=('GPL3')
provides=('hentaiathome' 'hentaiathome-cli' 'hentaiathome-gui')
conflicts=('hentaiathome-bin' 'hentaiathome-cli' 'hentaiathome-gui')
depends=('java-runtime>=8' 'hicolor-icon-theme' 'bash')
source=("HentaiAtHome_${pkgver}.zip::https://repo.e-hentai.org/hath/HentaiAtHome_${pkgver}_src.zip"
        "hentaiathome@.service"
        "hentaiathome.desktop"
        "hentaiathome-cli"
        "hentaiathome-gui")
sha256sums=('4d3f7d67b05089dab0c6d774999605cd121997f36d0ef5f75a380d90f73df29d'
            '5bde26294110d8454c40772ed147238741ab7d992e7c5f8054e2cd139222258f'
            'c50d1fb930990b033445351d7186634ed55bd083dbbb634680507300211145a6'
            'e4e225fb7186e18c6d8d8fd734a02ba11f83de15ef4ff5f103d21fbccb5b59fb'
            'e88bc1a25bcfb9d5767b40ae1d246e5ec01f9371ad4ce7ba2aa49729d9fbeec6')

build(){
    cd "${srcdir}"
    make
    make all
}
package(){
    cd "${srcdir}"
    install -Dm644 build/HentaiAtHome.jar "${pkgdir}/usr/lib/hath/HentaiAtHome.jar"
    install -Dm644 build/HentaiAtHomeGUI.jar "${pkgdir}/usr/lib/hath/HentaiAtHomeGUI.jar"
    install -Dm644 src/hath/gui/icon16.png "${pkgdir}/usr/share/icons/hicolor/16x16/apps/hentaiathome.png"
    install -Dm644 src/hath/gui/icon32.png "${pkgdir}/usr/share/icons/hicolor/32x32/apps/hentaiathome.png"
    install -Dm644 hentaiathome.desktop "${pkgdir}/usr/share/applications/hentaiathome.desktop"
    install -Dm644 hentaiathome@.service "${pkgdir}/usr/lib/systemd/system/hentaiathome@.service"
    install -Dm755 hentaiathome-cli "${pkgdir}/usr/bin/hentaiathome-cli"
    install -Dm755 hentaiathome-gui "${pkgdir}/usr/bin/hentaiathome-gui"
}

