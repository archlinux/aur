# Maintainer: en3 <ivanyalyshev@yandex.ru>

pkgname=planner-app-bin
pkgver=1.2.0
pkgrel=1
pkgdesc="Prebuilt Planner App desktop app with habit dashboard"
arch=("x86_64")
url="https://gitflic.ru/project/en3/planner-app"
license=("MIT")
depends=("gtk3" "webkit2gtk-4.1")
provides=("planner-app")
conflicts=("planner-app")
options=("!debug")
source=("https://gitflic.ru/project/en3/planner-app/release/9dd65284-e0db-4306-b71a-72659ece68a9/66b20ee9-ad56-42e2-a2da-0d87a8663e1d/download")
sha256sums=("c12d7a883dea48668c4c2697a98b60fb10e8eece902fa8dedc821da205f2ecd9")

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
