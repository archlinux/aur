# Maintainer: Anton Semjonov < anton \ät semjonov.de >

pkgname="truepolyglot"
pkgdesc="Create polyglot files that are valid PDF and ZIP at the same time. See POC||GTFO 07."

pkgver=1.6.1
pkgrel=1

arch=("any")
url="https://git.hackade.org/truepolyglot.git/"
license=("unknown")

depends=("python")
makedepends=()

provides=($pkgname)
conflicts=($pkgname)

source=("${url}/snapshot/${pkgname}-${pkgver}.tar.gz")
sha256sums=("655c4cf2000914b9b9504c2a2e39ee0e1bfb546c43ab851b028281ebcb0b7d93")

package() {
  cd "${pkgname}-${pkgver}"
  dest="usr/share/truepolyglot"
  find -type f -name '*.py' ! -path 'tests/*' -exec install -v -D -m 644 {} "$pkgdir/$dest/{}" \;
  install -v -D -m 755 truepolyglot "$pkgdir/$dest/truepolyglot"
  install -v -d -m 755 "$pkgdir/usr/bin/"
  ln -sv "/$dest/truepolyglot" "$pkgdir/usr/bin/truepolyglot"
}
