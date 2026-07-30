# Maintainer: Luke Hsiao <luke@hsiao.dev>
pkgname=pyproject-udeps-bin
pkgver=0.3.7
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

sha256sums=('dcb38c935dded9f5501230182432673310d7c1b6acff1e7a36e8ba4e32331066')
sha256sums_x86_64=('e6aa339104291a90a0b42a16d143ba53eea76f84fbe264b5d8f4133c9b0ad59e')
sha256sums_aarch64=('fd5fc96fb19f46c30c5156ac6dc6103c10d92057eb3dd8b666f15d6fefb47faf')
sha256sums_armv7h=('5624e81cbd4f176b76a5243186367eb93c9b300066b0bdc6116fe77460369f2a')

package() {
    install -Dm755 "$srcdir/pyproject-udeps" "$pkgdir/usr/bin/pyproject-udeps"
    cd "pyproject-udeps-$pkgver"
    install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
    install -Dm644 README.md  "$pkgdir/usr/share/doc/$pkgname/README.md"
}
