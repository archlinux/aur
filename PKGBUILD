# Maintainer: André <andre-arch@delorus.de>
pkgname=texbuild-git
_gitname=texbuild
pkgver=r8.e9e6369
pkgrel=1
pkgdesc="This small script continuously builds a latex file in the background. It only overwrites the target pdf file upon a successful and complete build allowing to continuously watch the PDF in PDF viewer."
arch=(any)
url="https://github.com/pbiggar/texbuild"
license=('GPL')
makedepends=('git')
source=('support-synctex.patch' 'git+https://github.com/pbiggar/texbuild.git')
md5sums=('01a5dd8b6bba24d6e0af076e7a8aa981' 'SKIP')

pkgver() {
  cd "${_gitname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/$_gitname"
  install -Dm755 texbuild ${pkgdir}/usr/bin/texbuild
}
