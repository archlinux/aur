# Contributor: Calogero e Angelo Scarnà <info@codelinsoft.it>
pkgname=clamav-gui
_pkgname=ClamAV-GUI-QT6-1.0.9
pkgver=1.0.9
pkgrel=1
pkgdesc="This application provides a graphical user interface for clamav and freshclam with an integrated service menu for Konqueror/Dolphin to scan files directly from your file manager."
url="https://github.com/wusel1007/clamav-gui"
arch=('x86_64')
depends=('qt6-base' 'qt6-connectivity' 'qt6-declarative' 'qt6-svg' 'qt6-tools'  'qt6-translations' 'clamav' 'desktop-file-utils')
license=(GPLv3)
source=('https://github.com/specialworld83/archlinux/raw/refs/heads/main/ClamAV-GUI-QT6-1.0.9.tar.gz'
        )
sha256sums=("SKIP"
            )

prepare() {
mv ${_pkgname} ${pkgname}-${pkgver}
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

