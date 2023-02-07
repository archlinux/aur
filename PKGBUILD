# Maintainer: wangzhichao <wangzhichao1990@126.com>
pkgname=tbtools
_pkgname=TBtools
pkgver=1.112
pkgrel=1
pkgdesc='GUI/CommandLine Tool Box for biologistists to utilize NGS data. '
arch=('x86_64')
license=('custom:commercial')
depends=('java-runtime>=1.8' 'bash')
url='https://github.com/CJ-Chen/TBtools'
source=("${_pkgname}-${pkgver}.zip::https://github.com/CJ-Chen/TBtools/archive/refs/tags/v${pkgver}.zip"
    "${_pkgname}.desktop"
)
sha256sums=(
    '32c209531143eb6955fc6a822b77b84f90545ec93043f73e415a17cfa839fb66'
    '3c12fbf52a0e3fb96fe62302f6b3938e8e42a393468620091ca7d9259073af13'
)
options=(!strip)

package() {
    mkdir -p ${pkgdir}/opt/${_pkgname}/
    unzip ${srcdir}/${_pkgname}-${pkgver}/TBtools_JRE1.6.jar
	install -Dm755 ${srcdir}/${_pkgname}-${pkgver}/Linux.sh ${pkgdir}/opt/${_pkgname}/
    install -Dm755 ${srcdir}/${_pkgname}-${pkgver}/TBtools_JRE1.6.jar ${pkgdir}/opt/${_pkgname}/
    install -Dm644 ${srcdir}/Icons/TBtoolsLogo.png ${pkgdir}/opt/${_pkgname}/TBtoolsLogo.png
	install -Dm644 ${srcdir}/${_pkgname}.desktop ${pkgdir}/usr/share/applications/${_pkgname}.desktop
}

