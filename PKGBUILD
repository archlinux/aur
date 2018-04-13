# Maintainer: ArchStrike <team@archstrike.org>

buildarch=128

pkgname=teamsql
pkgver=3.2.195
pkgrel=1
pkgdesc="Multi-Platform SQL Client"
url="https://teamsql.io/"
arch=('x86_64')
license=('custom:https://teamsql.io/end-user-licence-agreement')
depends=("libappindicator" "libnotify" "gconf" "libxtst" "libxss" "nss" "alsa-lib")
source=("TeamSQL-${pkgver}.deb::https://dlpuop5av9e02.cloudfront.net/linux/stable/${pkgver}/TeamSQL-${pkgver}.deb")
sha512sums=('b64ecc580d3d19d5a1135403c0c30cc06861ff7173033cafd99d053a4adde8e6f6a3f65d2221cba9579c235ca3b6c58313ac6e5ba32a12f6f8e7a8218b257617')

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
