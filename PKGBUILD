# Maintainer: Cristophero <cristophero.alvarado@gmail.com>
pkgname=pseint-bin
pkgver=20191127
pkgrel=1
pkgdesc="Una herramienta para aprender las bases de la programación mediante pseudocodigo en Español"
arch=('i686' 'x86_64')
url="http://pseint.sourceforge.net"
license=('GPL')
groups=()
depends=('libpng12' 'glu')
makedepends=()
optdepends=()
source_i686=(https://razaoinfo.dl.sourceforge.net/project/pseint/${pkgver}/$pkgname-l32-${pkgver}.tgz)
source_x86_64=(https://razaoinfo.dl.sourceforge.net/project/pseint/${pkgver}/$pkgname-l64-${pkgver}.tgz)
noextract=()
sha256sums_x86=("fd0cff776b6a97dc22d1852503d65d23bb0171bdace751f8ef38b86ffd821d74")
sha256sums_x86_64=("f63b7c56145f357f99aa856bcf3cafdacaae011a0a3c90f868ce3198b9833f08")

package() {
    mkdir -p "${pkgdir}/opt/pseint"
    cp -rv "${srcdir}/pseint/"* "${pkgdir}/opt/pseint"
    mkdir -p "${pkgdir}/usr/share/applications/"
    desktopfile="${pkgdir}/opt/pseint/pseint.desktop"
    touch $desktopfile
    echo "[Desktop Entry]" >> $desktopfile
    echo "Type=Application" >> $desktopfile
    echo "Name=PSeInt" >> $desktopfile
    echo "Comment=${pkgdesc}" >> $desktopfile
    echo "Comment[es]=Una herramienta para aprender las bases de la programación mediante pseudocodigo en español" >> $desktopfile
    echo "Exec=pseint" >> $desktopfile
    echo "Icon=/opt/pseint/imgs/icon.svg" >> $desktopfile
    echo "Terminal=false" >> $desktopfile
    echo "Categories=Development;IDE;" >> $desktopfile
    mkdir -p "${pkgdir}/usr/share/applications/"
    cp $desktopfile "${pkgdir}/usr/share/applications/"
    mkdir -p "${pkgdir}/usr/bin/"
    touch "${pkgdir}/usr/bin/pseint"
    echo "#!/usr/bin/env sh" >> "${pkgdir}/usr/bin/pseint"
    echo "/opt/pseint/wxPSeInt" >> "${pkgdir}/usr/bin/pseint"
    chmod +x "${pkgdir}/usr/bin/pseint"
}
