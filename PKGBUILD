# Maintainer: tarball <bootctl@gmail.com>

pkgname=noseyparker-bin
pkgver=0.14.0
pkgrel=1
pkgdesc='find secrets and sensitive information in textual data and Git history'
url='https://github.com/praetorian-inc/noseyparker'
arch=(x86_64)
license=(Apache)
provides=(noseyparker)
conflicts=(noseyparker)
depends=(glibc gcc-libs)
noextract=("$pkgname-$pkgver")

source=(
  "$pkgname-$pkgver::$url/releases/download/v$pkgver/noseyparker-v$pkgver-x86_64-unknown-linux-gnu"
  "rules-$pkgver.md::https://raw.githubusercontent.com/praetorian-inc/noseyparker/v$pkgver/docs/RULES.md"
)
sha256sums=('c18ea89708184818e6ba6df545028a014c609c07111d2886ccf4b589f4ecb438'
            'a33d69a307d35bb3ca40e1fc9bbe074642ec45a6a7a9cc1fdc2b756041e8ca32')

package() {
  install -Dm755 $pkgname-$pkgver \
    "$pkgdir/usr/bin/noseyparker"

  install -Dm644 rules-$pkgver.md \
    "$pkgdir/usr/share/doc/noseyparker/RULES.md"
}
