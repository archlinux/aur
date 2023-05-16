# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=rav1e-bin
pkgver=0.6.6
pkgrel=4
pkgdesc="The fastest and safest AV1 encoder"
arch=('i686' 'x86_64' 'aarch64')
url="https://github.com/xiph/rav1e"
license=('BSD' 'custom')
depends=('gcc-libs')
provides=("rav1e=$pkgver" 'librav1e.so')
conflicts=('rav1e')
source=("https://raw.githubusercontent.com/xiph/rav1e/master/LICENSE"
        "https://raw.githubusercontent.com/xiph/rav1e/master/PATENTS")
source_i686=("https://github.com/xiph/rav1e/releases/download/v$pkgver/rav1e-$pkgver-linux-i686.tar.gz"
               "https://github.com/xiph/rav1e/releases/download/v$pkgver/librav1e-$pkgver-linux-i686.tar.gz")
source_x86_64=("https://github.com/xiph/rav1e/releases/download/v$pkgver/rav1e-$pkgver-linux-sse4.tar.gz"
               "https://github.com/xiph/rav1e/releases/download/v$pkgver/librav1e-$pkgver-linux-sse4.tar.gz")
source_aarch64=("https://github.com/xiph/rav1e/releases/download/v$pkgver/rav1e-$pkgver-linux-aarch64.tar.gz"
                "https://github.com/xiph/rav1e/releases/download/v$pkgver/librav1e-$pkgver-macos-aarch64.tar.gz")
sha256sums=('SKIP'
            'SKIP')
sha256sums_i686=('d82655ea3501583a1fae02d4612539d1a7441c9bb9a9a73c5c08015446895081'
                 'c36cd0f6296f877294c1915e62a2c5b0d75202422f79d7ec85fb26ae52f36773')
sha256sums_x86_64=('1a5d5e4b9387fbe4be685713c87e46311a6ddd5eeb06c8fa3a806ff9c8ac57e7'
                   '2cb22e4272a1e740c06cc6c87d08f3a1ba9c993f9d2c88c1fd65f424aca642c3')
sha256sums_aarch64=('c74e6de887aa6fa179ec9954dd63ee8b0fafca08b2fdefa181212aef9b52871e'
                    '6e1b6afd05edb8b211526c669844e17dac4fbb3c847fb28984c11ceba85b5383')


package() {
  install -Dm755 "$srcdir/rav1e" -t "$pkgdir/usr/bin"
  mv "$srcdir"/{include,lib} -t "$pkgdir/usr"
  install -Dm644 "$srcdir"/{LICENSE,PATENTS} -t "$pkgdir/usr/share/licenses/rav1e"
}
