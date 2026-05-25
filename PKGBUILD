# Maintainer: en3 <ivanyalyshev@yandex.ru>

pkgname=planner-app-bin
pkgver=1.2.1
pkgrel=1
pkgdesc="Prebuilt Planner App desktop app with habit dashboard"
arch=("x86_64")
url="https://gitflic.ru/project/en3/planner-app"
license=("MIT")
depends=("gtk3" "webkit2gtk-4.1")
provides=("planner-app")
conflicts=("planner-app")
options=("!debug")

source=("https://gitflic.ru/project/en3/planner-app/release/4731a710-6a3f-4e36-89ac-6af83ce8437d/ce2b04ad-ac7b-4af8-939f-947ce5c7dd58/download")
sha256sums=("80a47c923a2ca9e71a72cd5d4f71e271077faa192265e096fa97a098b2eb52bb")

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
