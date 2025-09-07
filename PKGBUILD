pkgname=mcsr-launcher
pkgver=3.2.0
pkgrel=1
pkgdesc="Minecraft Speedrunning Launcher"
arch=('any')
url="https://github.com/MCSRLauncher/Launcher"
license=('GPL3')
depends=('java-runtime')
source=("MCSRLauncher.jar")
sha256sums=('SKIP')

package() {
  install -Dm644 "$srcdir/MCSRLauncher.jar" \
    "$pkgdir/usr/share/$pkgname/Launcher.jar"

  # Add run script
  install -Dm755 /dev/stdin "$pkgdir/usr/bin/mcsr-launcher" <<EOF
#!/bin/sh
exec java -jar /usr/share/$pkgname/Launcher.jar "\$@"
EOF
}
