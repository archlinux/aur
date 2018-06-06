# Maintainer: ArchStrike <team@archstrike.org>

buildarch=128

pkgname=teamsql
pkgver=3.4.207
pkgrel=1
pkgdesc="Multi-Platform SQL Client"
url="https://teamsql.io/"
arch=('x86_64')
license=('custom:https://teamsql.io/end-user-licence-agreement')
depends=("libappindicator" "libnotify" "gconf" "libxtst" "libxss" "nss" "alsa-lib")
source=("TeamSQL-${pkgver}.deb::https://dlpuop5av9e02.cloudfront.net/linux/stable/${pkgver}/TeamSQL-${pkgver}.deb")
sha512sums=('b53a863594252c46091acdbfc2b20958a2224947d6abc511e71376b60e44fa4af703d78467132e4fa2d36ae87807bc11f4af3f40044ee3fe17fbdded3239c270')

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
