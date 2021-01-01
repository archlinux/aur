# Maintainer: EatMyVenom <eat.my.venomm@gmail.com>
# Contributer: Dave Reisner <d@falconindy.com>

pkgname=asp-git
pkgver=6.r0.gc5efea2
pkgrel=1
pkgdesc="Arch Linux build source file management (git version)"
arch=('any')
url="https://github.com/archlinux/asp"
license=('MIT')
depends=('awk' 'bash' 'jq' 'git')
makedepends=('asciidoc')
conflicts=('asp')
provides=('asp')
source=("git://github.com/archlinux/asp")
md5sums=('SKIP')

pkgver() {
  cd 'asp'

  git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  make -C asp
}

package() {
  make -C asp PREFIX=/usr DESTDIR="$pkgdir" install

  install -Dm644 asp/LICENSE "$pkgdir/usr/share/licenses/asp/LICENSE"
}

# vim: ft=sh syn=sh et
