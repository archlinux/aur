# Maintainer: Cédric Connes <cedric.connes@gmail.com>

pkgname=chisel-tunnel-bin
pkgver=1.13.0
pkgrel=1
pkgdesc="A fast TCP tunnel over HTTP"
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/jpillora/chisel"
license=('MIT')
provides=('chisel-tunnel')
conflicts=('chisel-tunnel')
source=("README_${pkgver}.md::https://raw.githubusercontent.com/jpillora/chisel/v$pkgver/README.md"
        "users_${pkgver}.json::https://raw.githubusercontent.com/jpillora/chisel/v$pkgver/example/users.json"
	"LICENSE_${pkgver}::https://raw.githubusercontent.com/jpillora/chisel/v$pkgver/LICENSE")
source_i686=("chisel_${pkgver}_i686.gz::https://github.com/jpillora/chisel/releases/download/v$pkgver/chisel_${pkgver}_linux_386.gz")
source_x86_64=("chisel_${pkgver}_x86_64.gz::https://github.com/jpillora/chisel/releases/download/v$pkgver/chisel_${pkgver}_linux_amd64.gz")
source_armv6h=("chisel_${pkgver}_armv6h.gz::https://github.com/jpillora/chisel/releases/download/v$pkgver/chisel_${pkgver}_linux_armv6.gz")
source_armv7h=("chisel_${pkgver}_armv7h.gz::https://github.com/jpillora/chisel/releases/download/v$pkgver/chisel_${pkgver}_linux_armv7.gz")
source_aarch64=("chisel_${pkgver}_aarch64.gz::https://github.com/jpillora/chisel/releases/download/v$pkgver/chisel_${pkgver}_linux_arm64.gz")
sha256sums=('95df2e9dcd7bd3584cead15caf8405b52320a60997faab1170e0aaf247e77a08'
            'a9d4eb4b1f927dcd4dbc80c2763117ec2677bf11a8a1e8c55b19315328afc04e'
            '445b61eeea1445c155ad63e1c47b1abfa80a922f2f133577f19c12bf9582c0ff')
sha256sums_i686=('cdc1898d91f9762ab5ed4d27be4d40a32cc1f4d0a36177ae4665113007b1422d')
sha256sums_x86_64=('902a38e824bfb4d4e428faa45607a9b71fc74ff28bf1392cf8121650061c6971')
sha256sums_armv6h=('170c40eb8b9720931451124574ab7faaf3501b0875213ccd5498b1e8a84c89fd')
sha256sums_armv7h=('fdda34bfb81b571e9f7f433c2b73278f592e230e762e66d24b7d47dd37966419')
sha256sums_aarch64=('a23daaa1635741f8ef56a44e0506abcdf97251c03bb42433241bbb6c549814e4')

package() {
  install -D -m755 "chisel_${pkgver}_$CARCH" "$pkgdir/usr/bin/chisel"
  install -D -m644 "README_${pkgver}.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -D -m644 "users_${pkgver}.json" "$pkgdir/usr/share/doc/$pkgname/users.json"
  install -D -m644 "LICENSE_${pkgver}" "$pkgdir/usr/share/doc/$pkgname/LICENSE"
}
