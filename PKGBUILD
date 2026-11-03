# Maintainer: Ваше Имя <voltasar@gmail.com>

pkgname=se98-wm-theme
pkgver='1.83'
pkgrel=1
pkgdesc="Windows 98 Second Edition (Win98SE) inspired window manager theme for xfwm4, metacity, GTK2, GTK3, and GTK4"
arch=('any')
url="https://github.com/nestoris/se98-wm-theme"
license=('GPL3')
# Пакет не требует компиляции, только установку файлов
makedepends=()
optdepends=(
    'gtk2: for GTK2 applications'
    'gtk3: for GTK3 applications'
    'gtk4: for GTK4 applications'
    'xfwm4: for Xfce window manager'
    'metacity: for Metacity window manager'
)
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('8c3d2555896f1cdc9fd7685d585cb78a283259400baf65d87c428a457d065e3e')

package() {
    # Создаем директорию для темы
    install -d "$pkgdir/usr/share/themes/SE98"

    # Копируем все папки и файл index.theme
    cd "se98-wm-theme-$pkgver"
    cp -r gtk-2.0 gtk-3.0 gtk-4.0 metacity-1 xfwm4 index.theme "$pkgdir/usr/share/themes/SE98/"
}
