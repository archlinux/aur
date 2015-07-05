# Maintainer: Matt Kemp <matt@mattikus.com>

pkgname=pygist-git
pkgver=v1.1.r8.g159976c
pkgrel=1
pkgdesc="Python command line interface with gist.github.com"
url="http://github.com/mattikus/pygist"
license=('MIT')

source=("${pkgname}::git+https://github.com/mattikus/pygist.git")
sha256sums=('SKIP')

arch=('any')
depends=('python')
optdepends=('git: utilizes git-config to gather user information for github'
            'xclip: will yank pastes to clipboard automagically')
makedepends=('git')
conflicts=('pygist')
provides=('pygist')

pkgver() {
  cd "$pkgname"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "$srcdir/$pkgname"
  install -m755 pygist.py -D "$pkgdir/usr/bin/pygist"
}

