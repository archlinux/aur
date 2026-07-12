# Maintainer: Luke Hsiao <luke@hsiao.dev>
pkgname=pyproject-udeps-bin
pkgver=0.3.4
pkgrel=1
pkgdesc='Find unused dependencies in pyproject.toml (prebuilt binary)'
arch=('x86_64' 'aarch64' 'armv7h')
url='https://github.com/lukehsiao/pyproject-udeps'
license=('BlueOak-1.0.0')
depends=('gcc-libs')
provides=("pyproject-udeps=$pkgver")
conflicts=('pyproject-udeps')
# !debug: the release binary is already stripped, so the auto-generated
#   -debug subpackage would be empty noise.
options=(!debug)

_relurl="https://github.com/lukehsiao/pyproject-udeps/releases/download/v$pkgver"
source=("pyproject-udeps-$pkgver.tar.gz::https://github.com/lukehsiao/pyproject-udeps/archive/v$pkgver.tar.gz")
source_x86_64=("$_relurl/pyproject-udeps-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("$_relurl/pyproject-udeps-aarch64-unknown-linux-gnu.tar.gz")
source_armv7h=("$_relurl/pyproject-udeps-armv7-unknown-linux-gnueabihf.tar.gz")

sha256sums=('2a01d9c6b41eb1c0166812ddd3d842b8cc55aea463209147e6089255e32b99e1')
sha256sums_x86_64=('93fb8897dea4c95b8521d92488bdc47909afd5f5a7677e9be3fc756046b9fd3a')
sha256sums_aarch64=('4965d21a595b6d3ce0aa542a7bcb12a6f0b83a0e21b1b1f533226c051ad4361e')
sha256sums_armv7h=('742199bf1dbe345b9b60cf715f6e0ec1a87a88f525179da892cd773d8fcc9d63')

package() {
    install -Dm755 "$srcdir/pyproject-udeps" "$pkgdir/usr/bin/pyproject-udeps"
    cd "pyproject-udeps-$pkgver"
    install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
    install -Dm644 README.md  "$pkgdir/usr/share/doc/$pkgname/README.md"
}
