# Maintainer: Jean Lucas <jean@4ray.co>
# Contributor: Arthur Țițeică / arthur dot titeica with gmail

pkgname=morty-git
pkgver=0+73+5dca044
pkgrel=1
pkgdesc='Privacy-aware web content sanitizer proxy-as-a-service'
arch=(any)
url='https://github.com/asciimoo/morty'
license=(AGPL3)
provides=(morty)
makedepends=(git go)
optdepends=('searx-git: A privacy-respecting, hackable metasearch engine')
source=(git+https://github.com/asciimoo/morty.git)
sha512sums=(SKIP)

pkgver() {
  cd $srcdir/morty

  printf 0+%s+%s $(git rev-list --count HEAD) $(git rev-parse --short HEAD)
}

build() {
  cd $srcdir/morty

  GOPATH=$srcdir/morty go get -v -x github.com/asciimoo/morty
}

package() {
  cd $srcdir/morty

  install -D bin/morty $pkgdir/usr/bin/morty
}

# vim:set ts=2 sw=2 et:
