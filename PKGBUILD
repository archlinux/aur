# Contributor: zoe <chp321 [at] gmail (dot) com>
# Maintainer: zoe <chp321 [at] gmail (dot) com>

pkgname=jexiftoolgui
PkgName=jExifToolGUI
pkgver=1.8.1
pkgrel=1
pkgdesc="${PkgName} is a java/Swing graphical frontend for the excellent command-line ExifTool application by Phil Harvey"
arch=('any')
url="https://github.com/hvdwolf/${PkgName}"
license=("GNU General Public License v3.0")
depends=('java-runtime>=8' 'perl-image-exiftool' 'dcraw')
source=("https://github.com/hvdwolf/${PkgName}/releases/download/${pkgver}/${pkgname}-${pkgver}.deb")
md5sums=('057009cf8dbd32c5692e12c2916fadb4')

build() {
tar -xf data.tar.xz
rm *.tar.xz debian-binary
}

package() {
cd ${srcdir}
install -D -m755 -t ${pkgdir}/usr/bin/              usr/bin/${pkgname}
install -D -m644 -t ${pkgdir}/usr/share/${pkgname}/ usr/share/${pkgname}/*

install -D -m644 -t ${pkgdir}/usr/share/licenses/${pkgname}/ usr/share/doc/${pkgname}/copyright
install -D -m644 -t ${pkgdir}/usr/share/doc/${pkgname}/ usr/share/doc/${pkgname}/*

install -D -m644 -t ${pkgdir}/usr/share/icons/hicolor/48x48/apps/   usr/share/${pkgname}/${pkgname}-48x48.png 

sed -i 's/share\/jexiftoolgui\//share\/icons\/hicolor\/48x48\/apps\//g' usr/share/applications/${pkgname}.desktop
install -D -m644 -t ${pkgdir}/usr/share/applications/     usr/share/applications/${pkgname}.desktop
}
