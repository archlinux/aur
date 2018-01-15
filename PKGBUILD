# Maintainer: ArchStrike <team@archstrike.org>

buildarch=128

pkgname=teamsql
pkgver=2.6.159
pkgrel=4
pkgdesc="Multi-Platform SQL Client"
url="https://teamsql.io/"
arch=('x86_64')
license=('custom:https://teamsql.io/end-user-licence-agreement')
depends=("libappindicator" "libnotify" "gconf")

source=("TeamSQL-${pkgver}.deb::https://dlpuop5av9e02.cloudfront.net/linux/stable/${pkgver}/TeamSQL-${pkgver}.deb")
sha512sums=('1e6210d7c6703a6b080302c9ca640d31bb38da66f10981b520df2d41e5351b6005eb819aaa29083a2d1f42c083275d50d8a975ba34aab26362b0ec0adb715f61')

package() {
  bsdtar -xf data.tar.xz -C "$pkgdir/"

  mkdir "$pkgdir/usr/bin"

cat > "$pkgdir/usr/bin/$pkgname" <<EOF
#!/bin/bash
exec /opt/TeamSQL/TeamSQL "$@"
EOF

  chmod 755 "$pkgdir/usr/bin/$_pkgname"
}
