# Maintainer: Luc Khai Hai <lkh42t@gmail.com>
# Contributor: Rph <rphsoftware@gmail.com>

_name=shaka-packager
pkgname="$_name-bin"
pkgver='3.4.2'
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
sha256sums_x86_64=('7bdefe5a25fe84535c6c1a425f4c3c6b65fa85c441c2aeba01254b3c0f4b1956')
sha256sums_aarch64=('170ee824cc30a8ed7c7c22346c46bd614aa5532a4af16d9f3c8cfaed6eda268e')

package() {
    install -Dm755 "packager-$CARCH-$pkgver" "$pkgdir"/usr/bin/packager
    ln -s packager "$pkgdir"/usr/bin/shaka-packager
    install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/shaka-packager-bin/LICENSE
}
