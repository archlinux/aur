# Maintainer: Kainoa Kanter <kainoa@t1c.dev>
# extra repo Maintainer: Evangelos Foutras <foutrelis@archlinux.org>
# extra repo Contributor: Diogo Ferreira <diogo@underdev.org>

_pkgname=cloc
pkgname="${_pkgname}-git"
pkgver=r1174.gcb44139
pkgrel=1
pkgdesc="Count lines of code"
arch=('any')
provides=('cloc')
conflicts=('cloc')
url="https://github.com/AlDanial/cloc"
license=('GPL-2.0-or-later')
depends=('perl' 'perl-algorithm-diff' 'perl-regexp-common'
         'perl-parallel-forkmanager')
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_pkgname}" || exit
    printf "r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd $_pkgname/Unix
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
