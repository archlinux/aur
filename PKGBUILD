# Maintainer: Dave Reisner <d@falconindy.com>

pkgname=asp-git
pkgver=1
pkgrel=1
pkgdesc="Arch Linux build source file management (git version)"
arch=('any')
url="https://github.com/falconindy/asp"
license=('MIT')
depends=('awk' 'bash' 'jq' 'git')
makedepends=('asciidoc')
conflicts=('asp')
provides=('asp')
source=("git://github.com/falconindy/asp")
md5sums=('SKIP')

pkgver() {
  cd 'asp'

  git describe | sed 's/^v//'
}

build() {
  make -C asp
}

package() {
  make -C asp PREFIX=/usr DESTDIR="$pkgdir" install

  install -Dm644 asp/LICENSE "$pkgdir/usr/share/licenses/asp/LICENSE"
}

# vim: ft=sh syn=sh et
