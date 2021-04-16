# Maintainer: Coelacanthus <coelacanthus@outlook.com.com>
# Contributor: yjun <jerrysteve1101@gmail.com>

pkgbase=hentaiathome
pkgname=('hentaiathome-cli' 'hentaiathome-gui')
_pkgname=HentaiAtHome
pkgver=1.6.1
pkgrel=1
pkgdesc="An open-source Peer-2-Peer gallery distribution system which reduces the load on the E-Hentai Galleries"
arch=('x86_64')
url="https://ehwiki.org/wiki/Hentai@Home"
license=('GPL3')
provides=('hentaiathome-bin')
install="${pkgbase}.INSTALL"
source=("${pkgbase}-${pkgver}.zip::https://repo.e-hentai.org/hath/${_pkgname}_${pkgver}.zip"
        "${pkgbase}.sh"
        "${pkgbase}-gui.sh"
        "${pkgbase}.service"
        "${pkgbase}.desktop"
        "${pkgbase}.png::https://ehwiki.org/images/e/ef/H%40Hicon.png")
sha256sums=('b8889b2c35593004be061064fcb6d690ff8cbda9564d89f706f7e3ceaf828726'
            '6067fe31e5cdb9e05df2218f4761b7630d834725316099ed74609c86b11fe101'
            '49b8165512b981e73260b82686ed0c4004b626de1dcaa59039675e6ddc9041a4'
            'b3ddd3425c34c6872a471ed94b53a52ba77896aa2cc4295ead35f2e3728214d1'
            'f44c49afe7637b5bfbabd1c7fdee2c35acc2bb8e1d42a517c5c9a66715c0ac4e'
            '2f3461521c2eb9d5ee2d964169b2f502758b7679bef70ffe5d0dcfd04ecd7d97')

package_hentaiathome-cli() {
  depends=('java-runtime>=8')

  install -Dm 644 "${_pkgname}.jar" ${pkgdir}/usr/share/java/${pkgbase}/${_pkgname}.jar
  install -Dm 755 "${pkgbase}.sh"  ${pkgdir}/usr/bin/${pkgbase}

  install -dm 755 "${pkgdir}/usr/lib/systemd/system"
  install -Dm 755 "${pkgbase}.service" ${pkgdir}/usr/lib/systemd/system/hentaiathome.service
}

package_hentaiathome-gui() {
  depends=('java-runtime>=8' 'hentaiathome-cli')
  install -Dm 644 "${_pkgname}GUI.jar" ${pkgdir}/usr/share/java/${pkgbase}/${_pkgname}GUI.jar
  install -Dm 755 "${pkgbase}-gui.sh"  ${pkgdir}/usr/bin/${pkgbase}-gui

  install -Dm 644 "${pkgbase}.png" ${pkgdir}/usr/share/pixmaps/${pkgbase}.png
}
# vim:set sw=2 ts=2 et:
