# Maintainer: Sam A. Horvath-Hunt <hello@samhh.com>

pkgname=xclipd-git
_pkgname=xclipd
pkgver=0.0.0
pkgrel=1
pkgdesc='An X11 clipboard manager.'
url="https://github.com/jhunt/$_pkgname"
arch=('x86_64')
license=('MIT')
makedepends=('git')
source=(git+$url.git)
sha256sums=(SKIP)

build() {
  cd "$srcdir/$_pkgname"
  make
}

package() {
  cd "$srcdir/$_pkgname"
  install -Dm755 "xclipd" "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}

