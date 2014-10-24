# Maintainer: Thiago Perrotta <echo dGhpYWdvcGVycm90dGE5NUBnbWFpbC5jb20K | base64 -d >

_gitname=lastpass-cli
pkgname=lastpass-cli-git
pkgver=2014.10.22.g70acc1b
pkgrel=1
pkgdesc="LastPass command line interface tool (git version)"
arch=('i686' 'x86_64')
url="https://lastpass.com/"
license=('GPL2')
depends=('openssl' 'curl' 'libxml2')
makedepends=('asciidoc')
optdepends=('xclip: clipboard support'
       'pinentry: securelly read passwords')
source=("git+https://github.com/lastpass/${_gitname}.git")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_gitname}"
  git log -1 --format="%cd.g%h" --date=short | sed 's/-/./g'
}

build() {
    cd "${srcdir}/${_gitname}"
    make all doc
}

package() {
    cd "${srcdir}/${_gitname}"
    make DESTDIR="${pkgdir}/" install install-doc
}

# vim:set ts=2 sw=2 et:
