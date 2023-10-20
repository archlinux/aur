# Maintainer: tarball <bootctl@gmail.com>

pkgname=noseyparker-bin
pkgver=0.15.0
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
  "$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/noseyparker-v$pkgver-x86_64-unknown-linux-gnu.tar.gz"
  "rules-$pkgver.md::https://raw.githubusercontent.com/praetorian-inc/noseyparker/v$pkgver/docs/RULES.md"
)
sha256sums=('fb97504af9283ab7a00b3e67509f6a2dbaf716f910277655238d8d08bfc34fac'
            'a33d69a307d35bb3ca40e1fc9bbe074642ec45a6a7a9cc1fdc2b756041e8ca32')

package() {
  install -Dm644 rules-$pkgver.md \
    "$pkgdir/usr/share/doc/noseyparker/RULES.md"

  install -Dm755 bin/noseyparker \
    "$pkgdir/usr/bin/noseyparker"

  # tar.gz includes completions, but they're the same for all
  # shells and do not actually work in any of them
}
