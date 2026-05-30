# Maintainer: Luke Hsiao <luke@hsiao.dev>
pkgname=openring-rs-bin
pkgver=0.5.12
pkgrel=1
pkgdesc='A tool for generating a webring from Atom/RSS feeds, written in Rust (prebuilt binary)'
arch=('x86_64' 'aarch64' 'armv7h')
url='https://github.com/lukehsiao/openring-rs'
license=('BlueOak-1.0.0')
depends=('gcc-libs')
provides=('openring' "openring-rs=$pkgver")
conflicts=('openring' 'openring-rs')

_relurl="https://github.com/lukehsiao/openring-rs/releases/download/v$pkgver"
source=("openring-rs-$pkgver.tar.gz::https://github.com/lukehsiao/openring-rs/archive/v$pkgver.tar.gz")
source_x86_64=("$_relurl/openring-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("$_relurl/openring-aarch64-unknown-linux-gnu.tar.gz")
source_armv7h=("$_relurl/openring-armv7-unknown-linux-gnueabihf.tar.gz")

sha256sums=('c356715f79506ae807374da7e2620b2312a59cd3914263ef79573fdc428e6e2f')
sha256sums_x86_64=('1eb4316566e775d6cc9e867e4c764c49e0d24c6e2266a32687ed4085cf1a15c6')
sha256sums_aarch64=('aab858f24704c27cb7c4a589dde7b59ef83e3d75962b66c7400e64aa21c39b35')
sha256sums_armv7h=('7d436117a347cde5332db9d3a500a22de810d5a0f2145e9e9a624626da0cdfda')

package() {
    install -Dm755 "$srcdir/openring" "$pkgdir/usr/bin/openring"
    cd "openring-rs-$pkgver"
    install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
    install -Dm644 README.md  "$pkgdir/usr/share/doc/$pkgname/README.md"
}
