# Maintainer: Gergely Imreh <imrehg@gmail.com>

pkgname=juce
pkgdesc='Cross-platform C++ framework, including the Projucer C++ editor'
pkgver=5.0.2
pkgrel=1
arch=('i686' 'x86_64')
url='https://www.juce.com/'
license=('custom')
depends=('hicolor-icon-theme' 'webkit2gtk')
makedepends=()
optdepends=('java-environment: for graddle')
source=('https://d30pueezughrda.cloudfront.net/juce/juce-huckleberry-linux.zip'
        'Projucer.desktop'
        'Projucer.png')
sha256sums=('8e8b36c713e677611b736470cdc1102737ddff404a5dd34f30f5a1c72ecf3ad9'
            'f57572e3ff616fc349da7f6b581f09becbe469b8111ff7a83ce854be363d5de4'
            'f9ec15bbcb51b24a798f7d56680190e21829b9f6ff101f756beaccf95fbdad86')

package() {

    install -d "${pkgdir}/opt"

    cp -R "${srcdir}/JUCE" "${pkgdir}/opt/"
    install -d "${pkgdir}/usr/bin"
    ln -s ../../opt/JUCE/Projucer "${pkgdir}/usr/bin/Projucer"

    install -Dm644 "${srcdir}/Projucer.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/Projucer.png"
    install -Dm644 "${srcdir}/Projucer.desktop" "$pkgdir/usr/share/applications/Projucer.desktop"

    install -Dm644 "${srcdir}/JUCE/README.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
