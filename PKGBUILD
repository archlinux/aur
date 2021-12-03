# Maintainer: KokaKiwi <kokakiwi+aur@kokakiwi.net>

_themename=Lavender
pkgname=${_themename,,}-kde-theme-git
pkgver=r5.8cd7222
pkgrel=1
pkgdesc='A KDE theme inspired by lavender'
url='https://github.com/rkstrdee/Lavender'
license=('GPL3')
arch=('any')
makedepends=('git')
optdepends=('plasma-desktop: for plasma theme'
            'konsole: for konsole colorscheme')
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"

  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$pkgname"

  install -dm0755 "$pkgdir/usr/share/plasma"
  cp -rt "$pkgdir/usr/share/plasma" plasma/*

  install -dm0755 "$pkgdir/usr/share/konsole"
  cp -rt "$pkgdir/usr/share/konsole" konsole/*
}
