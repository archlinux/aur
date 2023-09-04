# Maintainer: Mikael Hannukainen <mikael.hannukainen@gmail.com>
pkgname=thcrap-steam-proton-wrapper-git
_pkgname="${pkgname%-git}"
pkgver=r24.519e82c
pkgrel=1
pkgdesc="A wrapper script for launching the official Touhou games on Steam with patches"
arch=('any')
url="https://github.com/tactikauan/thcrap-steam-proton-wrapper"
license=('Unlicense')
depends=('zenity' 'procps-ng' 'sed' 'coreutils')
makedepends=('git')
source=("$_pkgname::git+$url")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

package() {
  cd "$srcdir/$_pkgname"
  install -Dm755 "./thcrap_proton" "${pkgdir}/usr/bin/thcrap_proton"
}