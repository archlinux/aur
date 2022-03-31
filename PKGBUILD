# Maintainer: Maxwell Pray <synthead@gmail.com>

_pkgname=sndgrep
pkgname=$_pkgname-git
pkgver=r23.9de9256
pkgrel=1
pkgdesc="Search for specific frequencies (DTMF tones) in PCM audio"
arch=("x86_64")
url="https://github.com/enferex/sndgrep"
license=("GPL2")
source=("git+https://github.com/enferex/sndgrep.git")
sha256sums=("SKIP")

pkgver() {
  cd "$srcdir/$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$_pkgname"
  make
}

package() {
  install -Dm 755 "$srcdir/$_pkgname/sndgrep" "$pkgdir/usr/bin/sndgrep"
  install -Dm 644 "$srcdir/$_pkgname/README.md" "$pkgdir/usr/share/doc/$_pkgname/README.md"
}
