# Maintainer: Luke Hsiao <luke@hsiao.dev>
pkgname=pyproject-udeps-bin
pkgver=0.3.3
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

sha256sums=('2781151911ac663b519b0938c16527d56cc920b40d9f82075c67043ba23edf60')
sha256sums_x86_64=('21fac3bb6d38f7b2c374cd3f20b9acf622ed95f7160eda23bcb7d983d110582a')
sha256sums_aarch64=('f84f10f036949e3c61ac12c5040cee74ce5e1cb238964623a18d28d92a711943')
sha256sums_armv7h=('07ad519ee1bd57f171f287898251a03e6c0b641a9b54ad10d9de453cfd6057d2')

package() {
    install -Dm755 "$srcdir/pyproject-udeps" "$pkgdir/usr/bin/pyproject-udeps"
    cd "pyproject-udeps-$pkgver"
    install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
    install -Dm644 README.md  "$pkgdir/usr/share/doc/$pkgname/README.md"
}
