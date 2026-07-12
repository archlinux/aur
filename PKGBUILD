# Maintainer: Luke Hsiao <luke@hsiao.dev>
pkgname=pyproject-udeps-bin
pkgver=0.3.6
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

sha256sums=('a7b804cd14648acbb6635e639f3c90f9ca9afd069281cd56dfe879262e864852')
sha256sums_x86_64=('f1fe4cb3c28132200554a47766136d12862990315da876668dc88357c53fe744')
sha256sums_aarch64=('704db4db91c0d7bca18b6999b14483403012bca770a8cbc46ef09d0be1b6dec6')
sha256sums_armv7h=('62c49c98cef9daa81256bc9e41833fd0a47db59fb075f1200f94e20f7e41e31b')

package() {
    install -Dm755 "$srcdir/pyproject-udeps" "$pkgdir/usr/bin/pyproject-udeps"
    cd "pyproject-udeps-$pkgver"
    install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
    install -Dm644 README.md  "$pkgdir/usr/share/doc/$pkgname/README.md"
}
