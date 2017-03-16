# Maintainer: takeshix <kleber [at] adversec [dot] com>

_gitname=kleber
pkgname="${_gitname}-git"
pkgver=0.7.2.d41f4bd
pkgrel=1
pkgdesc='Kleber command line client for file uploads'
url='https://kleber.io'
arch=('any')
license=('GPL3')
depends=('bash' 'jq' 'xclip' 'imagemagick')
optdepends=('perl-image-exiftool')
makedepends=('git')
provides=('kleber')
conflicts=('kleber')
source=("${_gitname}::git://github.com/kleber-io/kleber-cli.git")
sha512sums=('SKIP')

pkgver() {
  cd ${_gitname}
  printf "%s.%s" "$(git describe --tags --abbrev=0|sed 's/^v//'|sed 's/\-/_/')" \
                 "$(git rev-parse --short HEAD)"
}

package() {
  cd ${_gitname}
  install -Dm755 kleber "${pkgdir}/usr/bin/kleber"
}

# vim: ts=2 sw=2
