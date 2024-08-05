# Maintainer: Jah Way <jahway603 at protonmail dot com>

pkgname=ramfetch-git
_pkgname=ramfetch
pkgver=1.1.0a.r0.gec9df6a
pkgrel=1
pkgdesc="A fetch which displays memory info using /proc/meminfo"
arch=('x86_64')
url="https://codeberg.org/jahway603/$_pkgname"
license=('MIT')
makedepends=('git')
conflicts=('ramfetch')
provides=('ramfetch')
source=("git+$url.git")
sha256sums=('SKIP')

# https://wiki.archlinux.org/title/VCS_package_guidelines
pkgver() {
  cd "$srcdir/${pkgname%-git}"
  git describe --long --tags --abbrev=7 | sed 's/-/.r/;s/-/./'
}

package() {
  cd $_pkgname
  install -Dm755 ramfetch "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}
