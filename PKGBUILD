# Maintainer: Miguel Useche <migueluseche@skatox.com>
# Contributor: mncarbone <mncarbone@gmail.com>
# Contributor: Cristophero <cristophero.alvarado@gmail.com>
pkgname=pseint
pkgver=20200501
pkgrel=1
pkgdesc="A tool for learning programming basis with a simple spanish pseudocode"
arch=('i686' 'x86_64')
url="http://pseint.sourceforge.net"
license=('GPL')
groups=()
depends=('libpng12' 'glu')
makedepends=()
optdepends=()
source_i686=(https://razaoinfo.dl.sourceforge.net/project/${pkgname}/${pkgver}/$pkgname-l32-${pkgver}.tgz)
source_x86_64=(https://razaoinfo.dl.sourceforge.net/project/${pkgname}/${pkgver}/$pkgname-l64-${pkgver}.tgz)
noextract=()
sha256sums_x86=("bfe1a22b8f794640c1d5e4f24da890d3faa88432405fb9f94d93d43ac89b9f1c")
sha256sums_x86_64=("a0d0af715163ae9052fc8b950923fb15d1503f6fc2fa3c564e964ff1f06922a7")

package() {
    mkdir -p "${pkgdir}/opt/${pkgname}"
    cp -rv "${srcdir}/${pkgname}/"* "${pkgdir}/opt/${pkgname}"
    mkdir -p "${pkgdir}/usr/share/applications/"
    desktopfile="${pkgdir}/opt/${pkgname}/${pkgname}.desktop"
    touch $desktopfile
    echo "[Desktop Entry]" >> $desktopfile
    echo "Type=Application" >> $desktopfile
    echo "Name=PSeInt" >> $desktopfile
    echo "Comment=${pkgdesc}" >> $desktopfile
    echo "Comment[es]=Una herramienta para aprender las bases de la programación mediante pseudocodigo en español" >> $desktopfile
    echo "Exec=${pkgname}" >> $desktopfile
    echo "Icon=/opt/${pkgname}/imgs/icon.svg" >> $desktopfile
    echo "Terminal=false" >> $desktopfile
    echo "Categories=Development;IDE;" >> $desktopfile
    mkdir -p "${pkgdir}/usr/share/applications/"
    cp $desktopfile "${pkgdir}/usr/share/applications/"
    mkdir -p "${pkgdir}/usr/bin/"
    touch "${pkgdir}/usr/bin/${pkgname}"
    echo "#!/usr/bin/env sh" >> "${pkgdir}/usr/bin/${pkgname}"
    echo "/opt/${pkgname}/wxPSeInt" >> "${pkgdir}/usr/bin/${pkgname}"
    chmod +x "${pkgdir}/usr/bin/${pkgname}"
}
