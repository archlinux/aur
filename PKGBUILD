pkgname='apk-preview'
pkgver=1.1
pkgrel=2
pkgdesc="A graphical user interface to see APK file details & icon"
arch=('x86_64')
url='https://github.com/alireza6677/apk-preview'
license=('GPL3')
depends=( 'python' 'python-gobject' 'unzip' 'android-tools' 'android-sdk-build-tools')
makedepends=('git')
provides=("apk-preview")
source=("${pkgname}::git+https://github.com/alireza6677/apk-preview.git")
md5sums=('SKIP')


prepare() {
    cd "${srcdir}/${pkgname}"

}
package() {
	cd "${srcdir}/${pkgname}" 
        install -d ${pkgdir}/usr/bin
        install -d ${pkgdir}/usr/share/apk-preview
	install -d ${pkgdir}/usr/share/icons/hicolor/scalable/apps/
        install -d ${pkgdir}/usr/share/applications/

        cp -a ./apk-preview ./apk-details ${pkgdir}/usr/bin/
        cp -a ./apk-preview-ui.glade ${pkgdir}/usr/share/apk-preview
        cp -a ./apk-preview.svg ${pkgdir}/usr/share/icons/hicolor/scalable/apps/
        cp -a ./apk_preview.desktop ${pkgdir}/usr/share/applications/
}

