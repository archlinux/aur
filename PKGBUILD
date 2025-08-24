# Maintainer: Pierre Chapuis <arch@catwell.info>

pkgname="minijinja-cli-bin"
pkgver=2.12.0
pkgrel=1
pkgdesc="Command-line utility for the MiniJinja template engine"
arch=(x86_64 aarch64)
url="https://github.com/mitsuhiko/minijinja"
license=(MIT)
depends=(glibc)
provides=(minijinja-cli)
conflicts=(minijinja-cli)
_archive="minijinja-cli-$CARCH-unknown-linux-gnu"

source_x86_64=("$pkgname-$pkgver.src.tar.xz::$url/releases/download/$pkgver/$_archive.tar.xz")
sha256sums_x86_64=("388a2442d013766fc9fafad339e60c6019389765895079dc04e1c35b6c3a417e")

source_aarch64=("$pkgname-$pkgver.src.tar.xz::$url/releases/download/$pkgver/$_archive.tar.xz")
sha256sums_aarch64=("1f795c34a9e32279864356c79fe191348dae833381f33107e5db7526f855c0b3")

package () {
    cd "$_archive"
    install -Dm0755 minijinja-cli "$pkgdir/usr/bin/minijinja-cli"
    install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
