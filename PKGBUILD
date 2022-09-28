# Maintainer: KristianB <kbrucaj at gmail dot com>
# Contributor: halfhorn <mwellsa at gmail dot com>
pkgname=wonderdraft
pkgver=1.1.7.3
pkgrel=1
pkgdesc="An intuitive yet powerful fantasy mapmaking tool."
arch=('x86_64')
url="https://www.wonderdraft.net"
license=('custom')
options=('!strip' '!emptydirs')
source=("file://Wonderdraft-${pkgver}-Linux64.zip")
md5sums=('0286f55568c803ef415152eb37e3c6ca')

prepare(){
    sed -i 's|opt/Wonder|opt/wonder|' "${srcdir}/Wonderdraft.desktop"
}

package(){
	install -D -m644 "EULA.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -D -m644 -t "${pkgdir}/usr/share/applications" "Wonderdraft.desktop"
    OPTDIR="${pkgdir}/opt/${pkgname}"
    mkdir -p "$OPTDIR"
    install -D -m644 -t "${OPTDIR}" "Wonderdraft.pck" "Wonderdraft.png"
    install -D -m755 -t "${OPTDIR}" "Wonderdraft.$CARCH"
}
