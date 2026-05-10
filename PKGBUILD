# Maintainer: ahmed-x86 <ahmdasnmr7@gmail.com>

pkgname=shamela-bin
pkgver=1447.11
pkgrel=5
pkgdesc="المكتبة الشاملة - نسخة غير رسمية مجمعة لأرش جنو لينكس"
arch=('x86_64')
url="https://shamela.ws/"
license=('custom')
depends=('libselinux' 'glibc' 'zlib' 'fontconfig' 'freetype2' 'hicolor-icon-theme')
provides=('shamela')
conflicts=('shamela')
options=('!strip' '!debug')
install=shamela.install

source=("shamela-linux.tar.xz::https://archive.org/download/shamela_download/shamela-linux-1447.11.tar.xz"
        "launch.sh"
        "shamela.desktop"
        "shamela.install"
        "shamela_icon.png")

sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP')

package() {
    
    install -d "${pkgdir}/opt/shamela"
    install -d "${pkgdir}/usr/bin"
    install -d "${pkgdir}/usr/share/applications"
    install -d "${pkgdir}/usr/share/icons/hicolor/256x256/apps"

    
    cp -r "${srcdir}/shamela/"* "${pkgdir}/opt/shamela/"


    install -m644 "${srcdir}/shamela_icon.png" "${pkgdir}/opt/shamela/shamela_icon.png" 
    

    install -m644 "${srcdir}/shamela_icon.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/shamela.png"
    

    install -m755 "${srcdir}/launch.sh" "${pkgdir}/opt/shamela/launch.sh" 
    

    ln -s /opt/shamela/launch.sh "${pkgdir}/usr/bin/shamela" 
    

    install -m644 "${srcdir}/shamela.desktop" "${pkgdir}/usr/share/applications/shamela.desktop" 
}