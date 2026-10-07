# Maintainer: Sinergia Comunidad Linuxera sinergia.comunidad.linuxuera@gmail.com
pkgname=sinergia-appimage-manager
pkgver=1.0.0
pkgrel=4
pkgdesc="Un gestor moderno y oscuro de AppImages para Linux con integración en KDE/Wayland"
arch=('any')
url="https://github.com/Nacho-Telmo/sinergia-appimage-manager"
license=('GPL3')
depends=('python' 'python-pyqt6')
optdepends=('desktop-file-utils: para actualizar la base de datos de escritorios')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Nacho-Telmo/sinergia-appimage-manager/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('bcce9d9f4332b95ef0d63e1fd51bc9d50a4db65ddbe3f37083b05248cbbc381b')

package() {
    cd "$pkgname-$pkgver"

    # Instalar tu script renombrado como comando limpio del sistema
    install -Dm755 appimage-manager.py "$pkgdir/usr/bin/appimage-manager"

    # Instalar el archivo .desktop para el menú de aplicaciones de Plasma
    install -Dm644 appimage-manager.desktop "$pkgdir/usr/share/applications/sinergia.desktop"

    install -Dm644 sinergia.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/sinergia.svg"

    # Instalar la licencia requerida por paquetes GPL en Arch
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
