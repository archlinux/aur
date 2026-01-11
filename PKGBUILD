# Maintainer: Julien Virey <julien.virey@gmail.com>

pkgname=ferrite-bin
pkgver=0.2.1
pkgrel=1
pkgdesc='A fast, lightweight text editor for Markdown, JSON, YAML, and TOML files.'
arch=('x86_64')
url=https://github.com/OlaProeis/Ferrite
license=('MIT')
depends=(glibc)
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")

source_x86_64=(
	$pkgname-$pkgver-x86_64.tar.gz::$url/releases/download/v$pkgver/${pkgname%-bin}-linux-x64.tar.gz
	LICENSE
)

sha256sums_x86_64=('121d475e5ef5e0c0d3cfd0c940612c19bcdde200c4e75aea38b55ce1be56a75d'
                   'c94952dae4438b71667a129c1f7dd0e196e6d7dbf37db4525511c69536c27ac1')
package() {
  install -Dm0755 -t "$pkgdir/usr/bin/" "${pkgname%-bin}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname%-bin}/LICENSE"
}
