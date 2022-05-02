# This file is part of BlackArch Linux ( https://www.blackarch.org/ ).
# See COPYING for license details.
# Maintainer: kerichuu <kerichuudev@gmail.com>

pkgname=salwyrr
pkgver=4
pkgrel=1
pkgdesc='The best launcher of Minecraft since 2017'
arch=('any')
url='https://salwyrr.com'
license=('custom:unknown')
depends=('java-environment')
makedepends=()
source=("https://salwyrr.com/$pkgver/Salwyrr%20Minecraft%20Launcher%20$pkgver.jar")
sha512sums=(e3c3d8d6287ad48a7fe6e2f7bce3b8732031373c15ddd1c4f56973b922df01ed0a3088c372a9939679a284e6c2e87e37519480525ee2fded1024442421f370d4)

package() {
  install -dm 755 "$pkgdir/usr/bin"

  install -Dm 755 "Salwyrr%20Minecraft%20Launcher%20$pkgver.jar" "$pkgdir/usr/share/$pkgname/Salwyrr%20Minecraft%20Launcher%20$pkgver.jar"

  cat > "$pkgdir/usr/bin/$pkgname" << EOF
#!/bin/sh
exec java -jar /usr/share/$pkgname/Salwyrr%20Minecraft%20Launcher%20$pkgver.jar"\$@"
EOF
  
  cat > "$HOME/.local/share/applications/$pkgname.desktop" << EOF
[Desktop Entry]
Name=Salwyrr
Exec=java -jar /usr/share/$pkgname/Salwyrr%20Minecraft%20Launcher%20$pkgver.jar
Type=Application
StartupNotify=true
EOF

  chmod +x "$pkgdir/usr/bin/$pkgname"
}