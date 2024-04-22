# Maintainer: Holden Grayer <grayer0113@outlook.com>

pkgname=leavesmc
_pkgver=1.20.4
_build=335f748
pkgver="${_pkgver}+${_build}"
pkgrel=2
pkgdesc="Fork of Paper aimed at repairing broken vanilla properties."
arch=('any')
url="https://leavesmc.org/"
license=('custom')
depends=('java-runtime>=17')
optdepends=('screen')
conflicts=('leavesmc-git')
source=("leavesmc.png"
        "leavesmc.desktop"
        "leavesmc-launch-script"
        "leavesmc-launch-script-gui"
        "${pkgname}-${pkgver}.jar"::"https://github.com/LeavesMC/Leaves/releases/download/${_pkgver}-${_build}/leaves-${_pkgver}.jar"
        "LICENSE_GPL"::"https://github.com/LeavesMC/Leaves/raw/master/licenses/GPL.md"
        "LICENSE_MIT"::"https://github.com/LeavesMC/Leaves/raw/master/licenses/MIT.md")
sha256sums=("720ee68108bbe12c362cf5ed05b3ad5b28bbaf53f3d7952d389bfc404a5baaac"
            "30bbd3bdb1d2722a118ac7c9d27afa70ffe06b0011b5cbb44dbcbea43cda441f"
            "60eb9f0bf69f3250409405e7bce73059ce766fe41bc789bb002245a6dc11ff28"
            "075b414af5a20c909b028c2c07da219e1c3acb6dc2c214ba53c8082733354ff8"
            "182f945c5c277b883b6fd22d62aeec88c52d834c4c161ce79a9aa6abc21e06ec"
            "0e1372769c3ea4ce2a8fb0955a02adf8e88d1804c6143518dee9f969eb0911f7"
            "559c62b6c55d1288098a4f744832081cdb7e0015139636cbbad1ad6cbe55ffea")

package() {
    install -Dm644 "leavesmc.png" "${pkgdir}/usr/share/icons/hicolor/128x128/apps/${pkgname}.png"
    install -Dm644 "leavesmc.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    install -Dm755 "leavesmc-launch-script" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm755 "leavesmc-launch-script-gui" "${pkgdir}/usr/bin/${pkgname}-gui"
    install -Dm644 "${pkgname}-${pkgver}.jar" "${pkgdir}/usr/share/java/${pkgname}/${pkgname}.jar"
    install -Dm644 "LICENSE_GPL" "${pkgdir}/usr/share/licenses/$pkgname/LICENSE_GPL"
    install -Dm644 "LICENSE_MIT" "${pkgdir}/usr/share/licenses/$pkgname/LICENSE_MIT"
}
