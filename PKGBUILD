# Maintainer: en3 <ivanyalyshev@yandex.ru>

pkgname=planner-app-bin
pkgver=1.3.0
pkgrel=1
pkgdesc="Prebuilt Planner App desktop app with habit dashboard"
arch=("x86_64")
url="https://gitflic.ru/project/en3/planner-app"
license=("MIT")
depends=("gtk3" "webkit2gtk-4.1")
provides=("planner-app")
conflicts=("planner-app")
options=("!debug")

source=("https://gitflic.ru/project/en3/planner-app/release/011c2608-ce8f-4bc4-b05f-9a68a8e9a771/8e488bd7-c37b-453d-b8de-46178631c44c/download")
sha256sums=("89e28a0bd56cb55c1c50648cbf29cd06bdb5932ff57fd82120ffe75ad097365b")

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
