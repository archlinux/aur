# Maintainer: Sinergia Comunidad Linuxera sinergia.comunidad.linuxuera@gmail.com
pkgname=sinergia-appimage-manager
pkgver=1.0.1
pkgrel=2
pkgdesc="Un gestor moderno y oscuro de AppImages para Linux con integración en KDE/Wayland"
arch=('any')
url="https://github.com/Nacho-Telmo/sinergia-appimage-manager"
license=('GPL3')
depends=('python' 'python-pyqt6')
optdepends=('desktop-file-utils: para actualizar la base de datos de escritorios')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Nacho-Telmo/sinergia-appimage-manager/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('d3e31aa8b3ca93d3f0cc8ce1b33a19ddc1b8aee3c334d85242fac75485a27fdf')


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
