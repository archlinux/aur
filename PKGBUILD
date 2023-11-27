# Maintainer: fossdd <fossdd@pwned.life>
pkgname=himitsu-git
_pkgname=${pkgname%-git}
pkgver=r157.c657d70
pkgrel=1
pkgdesc='Himitsu is a secret storage system for Unix systems'
url='https://sr.ht/~sircmpwn/himitsu'
license=(GPL-3.0)
arch=(x86_64 aarch64)
depends=()
makedepends=(hare-git)
optdepends=('hiprompt-gtk-py: prompter support (GTK+)')
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
  make PREFIX=/usr DESTDIR="$pkgdir" install
}
