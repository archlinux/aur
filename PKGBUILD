# Maintainer: Gergely Imreh <imrehg@gmail.com>

pkgname=juce
pkgdesc='Cross-platform C++ framework, including the Projucer C++ editor'
pkgver=4.3.1
pkgrel=1
arch=('i686' 'x86_64')
url='https://www.juce.com/'
license=('custom')
depends=('hicolor-icon-theme')
makedepends=()
optdepends=('java-environment: for graddle')
source=('http://assets.roli.com/juce/juce-grapefruit-linux.zip'
        'Projucer.desktop'
        'Projucer.png')
sha256sums=('8dd85dac8f0c6eb03744f93513233e1923618b06aae3b2ece8cfa51a67f88795'
            '2b3f696dd52434dbf3bd3e4488f8ce1dcc6f1715e74ef782704753df6a02cc5e'
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
