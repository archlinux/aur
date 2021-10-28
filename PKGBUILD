# Maintainer: Sam A. Horvath-Hunt <hello@samhh.com>

pkgver() {
  cd "$_pkgname"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

pkgname=xclipd-git
_pkgname=xclipd
pkgver=1.0.0.r0.gedd8a64
pkgrel=2
pkgdesc='An X11 clipboard manager.'
url="https://github.com/jhunt/$_pkgname"
arch=('x86_64')
license=('MIT')
makedepends=('git')
provides=('xclipd')
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

