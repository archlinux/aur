# Maintainer: wangzhichao <wangzhichao1990@126.com>
pkgname=tbtools
_pkgname=TBtools
pkgver=2.070
pkgrel=1
pkgdesc='GUI/CommandLine Tool Box for biologistists to utilize NGS data. '
arch=('x86_64')
license=('custom:commercial')
depends=('java-runtime>=1.8' 'bash')
url='https://github.com/CJ-Chen/TBtools'
source=("${_pkgname}-${pkgver}.zip::https://github.com/CJ-Chen/TBtools-II/archive/refs/tags/${pkgver}.zip"
    "${_pkgname}.desktop"
)
sha256sums=(
    'ed1d843d8985cd6fea05825ebfc38fdedf150692af0e2062fa49729e3387debf'
    '3c12fbf52a0e3fb96fe62302f6b3938e8e42a393468620091ca7d9259073af13'
)
options=(!strip)

package() {
    mkdir -p ${pkgdir}/opt/${_pkgname}/
    unzip ${srcdir}/${_pkgname}-II-${pkgver}/TBtools_JRE1.6.jar
	install -Dm755 ${srcdir}/${_pkgname}-II-${pkgver}/Linux.sh ${pkgdir}/opt/${_pkgname}/
    install -Dm755 ${srcdir}/${_pkgname}-II-${pkgver}/TBtools_JRE1.6.jar ${pkgdir}/opt/${_pkgname}/
    install -Dm644 ${srcdir}/Icons/TBtoolsLogo.png ${pkgdir}/opt/${_pkgname}/TBtoolsLogo.png
	install -Dm644 ${srcdir}/${_pkgname}.desktop ${pkgdir}/usr/share/applications/${_pkgname}.desktop
}

