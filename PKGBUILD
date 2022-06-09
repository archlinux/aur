# Maintainer: fossdd <fossdd@pwned.life>
pkgname=himitsu-git
_pkgname=${pkgname%-git}
pkgver=r96.414e5c3
pkgrel=1
pkgdesc='Himitsu is a secret storage system for Unix systems'
url='https://sr.ht/~sircmpwn/himitsu'
license=(GPL-3.0)
arch=(x86_64)
depends=()
makedepends=(hare-git hiprompt-gtk-git)
conflicts=()
provides=(himitsu)
source=("git+https://git.sr.ht/~sircmpwn/himitsu")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$_pkgname"
  make
}

check() {
  cd "$_pkgname"
  make check
}

package() {
  cd "$_pkgname"
  install -Dm755 "himitsu-init" "$pkgdir/usr/bin/himitsu-init"
  install -Dm755 "himitsud" "$pkgdir/usr/bin/himitsud"
  install -Dm755 "hiq" "$pkgdir/usr/bin/hiq"
}
