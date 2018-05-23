# Maintainer: ArchStrike <team@archstrike.org>

buildarch=128

pkgname=teamsql
pkgver=3.3.203
pkgrel=1
pkgdesc="Multi-Platform SQL Client"
url="https://teamsql.io/"
arch=('x86_64')
license=('custom:https://teamsql.io/end-user-licence-agreement')
depends=("libappindicator" "libnotify" "gconf" "libxtst" "libxss" "nss" "alsa-lib")
source=("TeamSQL-${pkgver}.deb::https://dlpuop5av9e02.cloudfront.net/linux/stable/${pkgver}/TeamSQL-${pkgver}.deb")
sha512sums=('7e16fe02921ebf6c9aa6d226ee0bb20a74408198813393b8b105188ed925613886f18b0dc05d44cea37d7a0024d9a3b25174decac977a82a1ec05a2babb0b427')

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
