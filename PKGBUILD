# Contributor: Calogero e Angelo Scarnà <info@codelinsoft.it>
pkgname=clamav-gui
_pkgname=clamav-gui
pkgver=1.0.6
pkgrel=1
pkgdesc="This application provides a graphical user interface for clamav and freshclam with an integrated service menu for Konqueror/Dolphin to scan files directly from your file manager."
url="https://github.com/wusel1007/clamav-gui"
arch=('x86_64')
depends=('qt6-base' 'qt6-connectivity' 'qt6-declarative' 'qt6-svg' 'qt6-tools'  'qt6-translations' 'qt5-x11extras' 'qt5-xmlpatterns' 'clamav' 'desktop-file-utils')
license=(GPLv3)
source=('git+https://github.com/wusel1007/clamav-gui'
        'https://raw.githubusercontent.com/specialworld83/archlinux/refs/heads/main/qt6_build_clamav_gui.patch')
sha256sums=("SKIP"
            "SKIP")



build() {
mv ${_pkgname} ${pkgname}-${pkgver}
cd "${srcdir}/${pkgname}-${pkgver}"/src
patch -i ${srcdir}/qt6_build_clamav_gui.patch
cd "${srcdir}/${pkgname}-${pkgver}"
qmake6 PREFIX=/usr
make
}

package() {
cd "${srcdir}/${pkgname}-${pkgver}"
make install DESTDIR=${pkgdir}

}

