# Maintainer: MISTER NEGATIVE <misternegative21@gmail.com>

pkgname=matsya-namaste
pkgver=23.01
pkgrel=1
pkgdesc="Welcome Application for Matsya OS"
arch=('any')
url="https://github.com/MatsyaOs/matsya-namaste"
license=('GPL-2.0-only')
depends=()
makedepends=()
source=("$url/archive/v$pkgver.tar.gz")
sha256sums=('SKIP')

destdir="/usr/share/matsya"
destdir_desktop="/etc/xdg/autostart"
destdir_icon="/usr/share/icons/hicolor/64x64/apps"

package() {
    cd matsya-namaste-$pkgver
    mkdir -p "${pkgdir}"/{"${destdir}","${destdir_desktop}","${destdir_icon}"}
    mkdir -p "${pkgdir}"/usr/share/applications
    cp -r ./data/. "${pkgdir}${destdir}"
    cp ./data/Welcome.desktop "${pkgdir}${destdir_desktop}"
    cp ./data/Welcome.desktop "${pkgdir}"/usr/share/applications
    install -Dm644 ./data/matsya.svg "${pkgdir}${destdir_icon}"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
