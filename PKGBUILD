# Maintainer: Cristophero <cristophero.alvarado@gmail.com>
pkgname=zinjai
pkgver=20191006
pkgrel=1
pkgdesc="IDE simple, rápido y completo para C++."
arch=('x86_64')
url="http://zinjai.sourceforge.net/"
license=('GPL')
groups=()
depends=('libpng12' 'glu')
makedepends=()
optdepends=()
source=(https://ufpr.dl.sourceforge.net/project/${pkgname}/${pkgname}-${pkgver}/$pkgname-l64-${pkgver}.tgz)
noextract=()
sha256sums=("c2864bce6e433a320bffea3f26ae0fa589126fd349bf0d10867b08ba342ca516")

package() {
    mkdir -p "${pkgdir}/opt/${pkgname}"
    cp -rv "${srcdir}/${pkgname}/"* "${pkgdir}/opt/${pkgname}"
    mkdir -p "${pkgdir}/usr/share/applications/"
    desktopfile="${pkgdir}/opt/${pkgname}/${pkgname}.desktop"
    touch $desktopfile
    echo "[Desktop Entry]" >> $desktopfile
    echo "Type=Application" >> $desktopfile
    echo "Name=ZinjaI" >> $desktopfile
    echo "Comment=${pkgdesc}" >> $desktopfile
    echo "Comment[es]=Un IDE simple, rápido y completo para C++." >> $desktopfile
    echo "Exec=${pkgname}" >> $desktopfile
    echo "Icon=/opt/${pkgname}/imgs/zinjai-256x256.png" >> $desktopfile
    echo "Terminal=false" >> $desktopfile
    echo "Categories=Development;IDE;" >> $desktopfile
    mkdir -p "${pkgdir}/usr/share/applications/"
    cp $desktopfile "${pkgdir}/usr/share/applications/"
    mkdir -p "${pkgdir}/usr/bin/"
    touch "${pkgdir}/usr/bin/${pkgname}"
    echo "#!/usr/bin/env sh" >> "${pkgdir}/usr/bin/${pkgname}"
    echo "/opt/${pkgname}/${pkgname}" >> "${pkgdir}/usr/bin/${pkgname}"
    chmod +x "${pkgdir}/usr/bin/${pkgname}"
}