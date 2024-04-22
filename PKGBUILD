# Maintainer: Holden Grayer <grayer0113@outlook.com>

pkgname=leavesmc
_pkgver=1.20.4
_build=335f748
pkgver="${_pkgver}+${_build}"
pkgrel=3
pkgdesc="Fork of Paper aimed at repairing broken vanilla properties."
arch=('any')
url="https://leavesmc.org/"
license=('custom')
depends=('java-runtime>=17')
optdepends=('screen')
provides=('leavesmc-git')
conflicts=('leavesmc-git')
source=("leavesmc.png"
        "leavesmc.desktop"
        "leavesmc-launch-script"
        "${pkgname}-${pkgver}.jar"::"https://github.com/LeavesMC/Leaves/releases/download/${_pkgver}-${_build}/leaves-${_pkgver}.jar"
        "LICENSE_GPL"::"https://github.com/LeavesMC/Leaves/raw/master/licenses/GPL.md"
        "LICENSE_MIT"::"https://github.com/LeavesMC/Leaves/raw/master/licenses/MIT.md")
sha256sums=("720ee68108bbe12c362cf5ed05b3ad5b28bbaf53f3d7952d389bfc404a5baaac"
            "4a03cc59260564cbd176260250a4256e56793d4e82e40c61d421dd549c981022"
            "d967d878d6d2d80e034ba31fb1852cc45243c9339bede3959d1274b1f1761367"
            "182f945c5c277b883b6fd22d62aeec88c52d834c4c161ce79a9aa6abc21e06ec"
            "0e1372769c3ea4ce2a8fb0955a02adf8e88d1804c6143518dee9f969eb0911f7"
            "559c62b6c55d1288098a4f744832081cdb7e0015139636cbbad1ad6cbe55ffea")

package() {
    install -Dm644 "leavesmc.png" "${pkgdir}/usr/share/icons/hicolor/128x128/apps/${pkgname}.png"
    install -Dm644 "leavesmc.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    install -Dm755 "leavesmc-launch-script" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${pkgname}-${pkgver}.jar" "${pkgdir}/usr/share/java/${pkgname}/${pkgname}.jar"
    install -Dm644 "LICENSE_GPL" "${pkgdir}/usr/share/licenses/$pkgname/LICENSE_GPL"
    install -Dm644 "LICENSE_MIT" "${pkgdir}/usr/share/licenses/$pkgname/LICENSE_MIT"
}
