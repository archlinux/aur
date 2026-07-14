# Maintainer: en3 <ivanyalyshev@yandex.ru>

pkgname=planner-app-bin
pkgver=1.3.1
pkgrel=1
pkgdesc="Prebuilt Planner App desktop app with habit dashboard"
arch=("x86_64")
url="https://gitflic.ru/project/en3/planner-app"
license=("MIT")
depends=("gtk3" "webkit2gtk-4.1")
provides=("planner-app")
conflicts=("planner-app")
options=("!debug")

source=("https://gitflic.ru/project/en3/planner-app/release/7b960493-bc1c-4ea0-9a51-39c792d6fe32/418b45eb-4857-49cd-b496-fa20bc69393e/download")
sha256sums=("2dc7a82812f83d36bfde033d027f06f131cc286280cb2d7e2d011502a408df3f")

package() {
  cd "$srcdir"

  install -Dm755 "planner-app" "${pkgdir}/usr/bin/planner-app"

  install -Dm644 "icons/icon.png" \
    "${pkgdir}/usr/share/pixmaps/planner-app.png"

  install -Dm644 /dev/stdin \
    "${pkgdir}/usr/share/applications/planner-app.desktop" <<EOF
[Desktop Entry]
Name=Planner App
Comment=Planner App with Tasks and Habit Tracker
Exec=planner-app
Icon=planner-app
Terminal=false
Type=Application
Categories=Utility;Office;
StartupNotify=true
EOF
}
