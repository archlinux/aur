# Maintainer: Luc Khai Hai <lkh42t@gmail.com>
# Contributor: Rph <rphsoftware@gmail.com>

_name=shaka-packager
pkgname="$_name-bin"
pkgver='2.6.1'
pkgrel=2
pkgdesc='A tool and a media packaging SDK for DASH and HLS packaging and encryption.'
arch=('x86_64' 'aarch64')
url='https://github.com/shaka-project/shaka-packager'
license=('BSD')
provides=("$_name")
conflicts=("$_name")
replaces=("$_name")
source=("https://raw.githubusercontent.com/shaka-project/shaka-packager/v$pkgver/LICENSE")
source_x86_64=("packager-x86_64-$pkgver::https://github.com/shaka-project/shaka-packager/releases/download/v$pkgver/packager-linux-x64")
source_aarch64=("packager-aarch64-$pkgver::https://github.com/shaka-project/shaka-packager/releases/download/v$pkgver/packager-linux-arm64")
sha256sums=('16f1483c4e6e0f851f2606587a222cf8fe6215837ce309a1ad0e3f21580b99f7')
sha256sums_x86_64=('328317e8f12dbcf9a5a172704699c2da51e54feb68cec5787666c2ab07b2c88d')
sha256sums_aarch64=('ebeed27e7c1546ca85c08effd45ef2a95b64255228385526868194dcfea0750d')

package() {
    install -Dm755 "packager-$CARCH-$pkgver" "$pkgdir"/usr/bin/packager
    ln -s packager "$pkgdir"/usr/bin/shaka-packager
    install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/shaka-packager-bin/LICENSE
}
