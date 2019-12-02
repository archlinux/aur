# Maintainer: martin sandsmark <martin.sandsmark@kde.org>

pkgname=ageofconquerors-trial-data
pkgver=1
pkgrel=1
pkgdesc="Data files from Age of Empires II: The Conquerors Demo"
arch=('any')
url='https://www.ageofempires.com/'
license=('custom')
source=(https://archive.org/download/AgeOfEmpiresIiTheConquerorsDemo/Age2XTrial.exe)
sha1sums=('a0b27848a70bcda203837573445de6e243920170')
makedepends=('cabextract')

build() {
    cd "${srcdir}"
    cabextract Age2XTrial.exe
}

package() {
    cd "${srcdir}"

    install -Dm 0644 Data/*.{drs,dat,Dat} -t "${pkgdir}/usr/share/ageofconquerors-trial/Data"

    install -Dm 0644 Campaign/Media/* -t "${pkgdir}/usr/share/ageofconquerors-trial/Campaign/Media/"
    install -Dm 0644 Campaign/*.cpx -t "${pkgdir}/usr/share/ageofconquerors-trial/Campaign/"

    install -Dm 0644 Sound/Campaign/*.mp3 -t "${pkgdir}/usr/share/ageofconquerors-trial/Sound/Campaign/"
    install -Dm 0644 Sound/Scenario/*.mp3 -t "${pkgdir}/usr/share/ageofconquerors-trial/Sound/Scenario/"
    install -Dm 0644 Sound/Midi/*.mid -t "${pkgdir}/usr/share/ageofconquerors-trial/Sound/Midi/"

    install -Dm 0644 language{,_x1}.dll -t "${pkgdir}/usr/share/ageofconquerors-trial/"

    install -Dm 644 EULAx.RTF -t "${pkgdir}/usr/share/licenses/${pkgname}/"
    install -Dm 644 Readmex.rtf -t "${pkgdir}/usr/share/doc/${pkgname}"
}
