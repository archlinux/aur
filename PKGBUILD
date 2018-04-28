# Maintainer: ArchStrike <team@archstrike.org>

buildarch=128

pkgname=teamsql
pkgver=3.3.201
pkgrel=1
pkgdesc="Multi-Platform SQL Client"
url="https://teamsql.io/"
arch=('x86_64')
license=('custom:https://teamsql.io/end-user-licence-agreement')
depends=("libappindicator" "libnotify" "gconf" "libxtst" "libxss" "nss" "alsa-lib")
source=("TeamSQL-${pkgver}.deb::https://dlpuop5av9e02.cloudfront.net/linux/stable/${pkgver}/TeamSQL-${pkgver}.deb")
sha512sums=('d9e667a49174e830ae070f9aa511f72647a3014dfb6472a343cfa8441d64a3e0a5ee621ade3163de80aa0e07df520c880058d0c2dc2461b79cc0764fee6d8496')

package() {
	install -dm755 "${pkgdir}/usr/bin"
	bsdtar -xf data.tar.xz -C "$pkgdir/"

cat > "$pkgdir/usr/bin/$pkgname" <<EOF
#!/usr/bin/env bash
exec /opt/TeamSQL/TeamSQL "\$@"
EOF

	chmod 755 "$pkgdir/usr/bin/$pkgname"
}

# vim:se ts=2 sw=2 et:
