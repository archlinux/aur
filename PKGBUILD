# Maintainer: Luke Hsiao <luke@hsiao.dev>
pkgname=pyproject-udeps-bin
pkgver=0.3.5
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

sha256sums=('777a4e42155d5c820b0258d3a8dc0ace1df32781b71e18bf81cc8c95129c51c8')
sha256sums_x86_64=('f3c98655396465f6f96adad67b4bf3412716287def30cf0e9711d4592dd14fc5')
sha256sums_aarch64=('f39dc5bdcdce4767d32c309f5ee8dacc7995f3203bf19a5c2ee382df3618591d')
sha256sums_armv7h=('4821a6c69f63021a6054c2763762a58cef8c2d6c581204fbe76d5c79595ee739')

package() {
    install -Dm755 "$srcdir/pyproject-udeps" "$pkgdir/usr/bin/pyproject-udeps"
    cd "pyproject-udeps-$pkgver"
    install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
    install -Dm644 README.md  "$pkgdir/usr/share/doc/$pkgname/README.md"
}
