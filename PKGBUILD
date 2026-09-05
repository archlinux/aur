# Maintainer: Luc Khai Hai <lkh42t@gmail.com>
# Contributor: Rph <rphsoftware@gmail.com>

_name=shaka-packager
pkgname="$_name-bin"
pkgver=3.9.3
pkgrel=1
pkgdesc='A tool and a media packaging SDK for DASH and HLS packaging and encryption.'
arch=('x86_64' 'aarch64')
url='https://github.com/shaka-project/shaka-packager'
license=('BSD-3-Clause')
provides=("$_name")
conflicts=("$_name")
replaces=("$_name")
source=("https://raw.githubusercontent.com/shaka-project/shaka-packager/v$pkgver/LICENSE")
source_x86_64=("packager-x86_64-$pkgver::https://github.com/shaka-project/shaka-packager/releases/download/v$pkgver/packager-linux-x64")
source_aarch64=("packager-aarch64-$pkgver::https://github.com/shaka-project/shaka-packager/releases/download/v$pkgver/packager-linux-arm64")
sha256sums=('0eea5a66a8505f758fdc8710637c5b4f5f1b18b29d0f248d6e95a3cdfc8fb599')
sha256sums_x86_64=('7a3cf35ad146fd7810b4ededab363c8a3e6121d1b2c8391f53863126186f9ee6')
sha256sums_aarch64=('d3a50cecc139b54435be1bbbfba5c0ea822d9e1e7edc3531f7821fba65ceebb0')

package() {
    install -Dm755 "packager-$CARCH-$pkgver" "$pkgdir"/usr/bin/packager
    ln -s packager "$pkgdir"/usr/bin/shaka-packager
    install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/shaka-packager-bin/LICENSE
}
