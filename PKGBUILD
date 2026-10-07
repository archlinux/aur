# Maintainer: Nacho-Telmo <ignacio.ezcurra@yahoo.com.ar>
pkgname=sinergia-appimage-manager
pkgver=1.0.0
pkgrel=3
pkgdesc="Un gestor moderno y oscuro de AppImages para Linux con integración en KDE/Wayland"
arch=('any')
url="https://github.com/Nacho-Telmo/sinergia-appimage-manager"
license=('GPL3')
depends=('python' 'python-pyqt6')
optdepends=('desktop-file-utils: para actualizar la base de datos de escritorios')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Nacho-Telmo/sinergia-appimage-manager/archive/refs/tags/v$pkgver.tar.gz"
        "sinergia.svg")
sha256sums=('bcce9d9f4332b95ef0d63e1fd51bc9d50a4db65ddbe3f37083b05248cbbc381b'
            '074d2d6b04ffd0482d053e8025a93cb866616a44a75f56f88b3ae20fd7f05048')

package() {
    cd "$pkgname-$pkgver"

    install -Dm755 appimage-manager.py "$pkgdir/usr/bin/appimage-manager"
    install -Dm644 appimage-manager.desktop "$pkgdir/usr/share/applications/sinergia.desktop"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    # Instalamos el icono desde el directorio principal del paquete (fuera de la carpeta extraída)
    install -Dm644 "$srcdir/sinergia.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/sinergia.svg"
}
