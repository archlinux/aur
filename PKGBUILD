# Maintainer: Gergely Imreh <imrehg@gmail.com>

pkgname=juce
pkgdesc='Cross-platform C++ framework, including the Projucer C++ editor'
pkgver=5.0.1
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
sha256sums=('8324a105c46a299cbbf136886281fec9d0c560bbd74c142478f23d6b1b325281'
            'f57572e3ff616fc349da7f6b581f09becbe469b8111ff7a83ce854be363d5de4'
            'f9ec15bbcb51b24a798f7d56680190e21829b9f6ff101f756beaccf95fbdad86')


package() {

    install -d "${pkgdir}/opt"

    cp -R "${srcdir}/JUCE" "${pkgdir}/opt/"
    install -d "${pkgdir}/usr/bin"
    ln -s ../../opt/JUCE/Projucer "${pkgdir}/usr/bin/Projucer"

    install -Dm644 "${srcdir}/Projucer.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/Projucer.png"
    install -Dm644 "${srcdir}/Projucer.desktop" "$pkgdir/usr/share/applications/Projucer.desktop"

    install -Dm644 "${srcdir}/JUCE/README.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
