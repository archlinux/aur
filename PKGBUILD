# Maintainer: Étienne Deparis <etienne@depar.is>
pkgname=ttf-dm-mono-git
_pkgname=ttf-dm-mono
pkgver=1.000r5.57fadab
pkgrel=2
pkgdesc="A three weight, three style family designed for DeepMind."
arch=("any")
url="https://github.com/googlefonts/dm-mono"
license=("OTF")
depends=(fontconfig)
makedepends=("git")
source=("git+https://github.com/googlefonts/dm-mono.git")
md5sums=("SKIP")
provides=("ttf-dm-mono")
conflicts=("ttf-dm-mono")

pkgver() {
    cd "$srcdir/dm-mono"
    printf "1.000r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/dm-mono"
  install -d -m755 "$pkgdir/usr/share/licenses/$_pkgname"
  install -D -m644 README.md "$pkgdir/usr/share/licenses/$_pkgname/README.md"
  install -D -m644 AUTHORS.txt "$pkgdir/usr/share/licenses/$_pkgname/AUTHORS.txt"
  install -D -m644 CONTRIBUTORS.txt "$pkgdir/usr/share/licenses/$_pkgname/CONTRIBUTORS.txt"

  install -d -m755 "$pkgdir/usr/share/fonts/TTF"
  install -D -m644 exports/*.ttf "$pkgdir/usr/share/fonts/TTF/"
}
