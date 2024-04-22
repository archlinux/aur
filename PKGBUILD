# Maintainer: Holden Grayer <grayer0113@outlook.com>

pkgname=leavesmc
_pkgver=1.20.4
_build=335f748
pkgver="${_pkgver}+${_build}"
pkgrel=1
pkgdesc="Fork of Paper aimed at repairing broken vanilla properties."
arch=('any')
url="https://leavesmc.org/"
license=('custom')
depends=('java-runtime>=17')
optdepends=('screen')
conflicts=('leavesmc-git')
source=("leavesmc-launch-script"
        "${pkgname}-${pkgver}.jar"::"https://github.com/LeavesMC/Leaves/releases/download/${_pkgver}-${_build}/leaves-${_pkgver}.jar"
        "LICENSE_${pkgver}"::"https://github.com/LeavesMC/Leaves/raw/master/PATCHES-LICENSE")
sha256sums=("60eb9f0bf69f3250409405e7bce73059ce766fe41bc789bb002245a6dc11ff28"
            "182f945c5c277b883b6fd22d62aeec88c52d834c4c161ce79a9aa6abc21e06ec"
            "1b3782ccad7b8614100cda30d3faf42fc39f2e97932908c543005053b654ca68")
package() {
    install -Dm755 "leavesmc-launch-script" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${pkgname}-${pkgver}.jar" "${pkgdir}/usr/share/java/${pkgname}/${pkgname}.jar"
    install -Dm644 "LICENSE_${pkgver}" "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}
