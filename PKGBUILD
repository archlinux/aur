# Contributor: Calogero e Angelo Scarnà <info@codelinsoft.it>
pkgname=clamav-gui
_pkgname=ClamAV-GUI-QT6-1.1.0-127.2
__pkgname=ClamAV-GUI-QT6-1.1.2
pkgver=1.1.0
pkgrel=1
pkgdesc="This application provides a graphical user interface for clamav and freshclam with an integrated service menu for Konqueror/Dolphin to scan files directly from your file manager."
url="https://github.com/wusel1007/clamav-gui"
arch=('x86_64')
depends=('qt6-base' 'qt6-connectivity' 'qt6-declarative' 'qt6-svg' 'qt6-tools'  'qt6-translations' 'clamav' 'desktop-file-utils')
license=(GPLv3)
source=('https://download.opensuse.org/repositories/home:/wusel1007/openSUSE_Tumbleweed/src/ClamAV-GUI-QT6-1.1.2-127.2.src.rpm'
        )
sha256sums=("SKIP"
            )
package() {
    cd ${srcdir}/
    bsdtar -xf ${_pkgname}.src.rpm -C ${srcdir}
}

prepare() {
   cd ${srcdir}/
   tar -xf ${__pkgname}.tar.gz -C ${srcdir}
   mv ${__pkgname} ${pkgname}-${pkgver}
 
}

build() {
cd "${srcdir}/${pkgname}-${pkgver}"
qmake6 PREFIX=/usr
make -j4
}

package() {
cd "${srcdir}/${pkgname}-${pkgver}"
make install DESTDIR=${pkgdir}

}

