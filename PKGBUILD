# Maintainer: Xavier Francisco <echo moc.liamg@ocsicnarf.n.reivax | rev>

_pkgname=gritql
pkgname=gritql-bin
pkgver=0.1.0alpha.1743007075
pkgrel=1
_tag="v0.1.0-alpha.1743007075"
pkgdesc="GritQL query language for searching, linting, and modifying source code (prebuilt 'grit' CLI)"
arch=('x86_64' 'aarch64')
url="https://github.com/biomejs/gritql"
license=('MIT')
depends=('gcc-libs' 'glibc' 'zlib')
provides=("$_pkgname")
# The upstream binary is /usr/bin/grit, which collides with the unrelated
# 'grit' AUR package (Game Raster Image Transmogrifier).
conflicts=("$_pkgname" 'grit')
source=("LICENSE-$pkgver::https://raw.githubusercontent.com/biomejs/gritql/$_tag/LICENSE")
source_x86_64=("grit-$pkgver-x86_64.tar.gz::https://github.com/biomejs/gritql/releases/download/$_tag/grit-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("grit-$pkgver-aarch64.tar.gz::https://github.com/biomejs/gritql/releases/download/$_tag/grit-aarch64-unknown-linux-gnu.tar.gz")
sha256sums=('d0bed1dabb4f2e1d6828349e690f2137d99575e86ec2c7545c74ae53d8430e43')
sha256sums_x86_64=('94b34641a538ca0e85a92aa7f0ac94077fc6d663c996d0556c781d3d4c163149')
sha256sums_aarch64=('8e37415c45595716386d018f4d279a78f80261a7c7592c37632e7ce7d0934870')

package() {
  install -Dm755 "$srcdir/grit-${CARCH}-unknown-linux-gnu/grit" "$pkgdir/usr/bin/grit"
  install -Dm644 "$srcdir/LICENSE-$pkgver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
