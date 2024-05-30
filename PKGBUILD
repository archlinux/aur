# Contibutor: Caltlgin Stsodaat <contact@fossdaily.xyz>

_pkgname=webdump
pkgname=webdump-git
pkgver=r51.a0118e6
pkgrel=1
pkgdesc='HTML to plain-text converter tool'
arch=('i686' 'pentium4' 'x86_64' 'armv7h' 'armv6h' 'aarch64')
url='https://www.codemadness.org/git/webdump/file/README.html'
license=('ISC')
makedepends=('git')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git://git.codemadness.org/$_pkgname")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  make -C "$_pkgname"
}

package() {
  make DESTDIR="$pkgdir" PREFIX="/usr" MANPREFIX="/usr/share/man" -C "$_pkgname" install
  install -Dvm644 "$_pkgname/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname"
}

# vim: ts=2 sw=2 et:
