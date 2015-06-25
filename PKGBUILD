# Maintainer: Behnam Momeni <sbmomeni [at the] gmail [dot] com>

pkgname=('visual-pdf-diff-git')

_gitname=visual-pdf-diff
#The actual value is calculated by pkgver() function
pkgver=v1.0.0
pkgrel=1

pkgdesc="Merges two PDF files into one PDF file and highlights their visual differences."
url="https://github.com/momeni/${_gitname}"

arch=('any')
license=('GPL3')

depends=('imagemagick' 'gawk' 'bash' 'coreutils')
conflicts=('visual-pdf-diff')
provides=('visual-pdf-diff')
makedepends=('git')
source=('git+https://github.com/momeni/visual-pdf-diff.git')
sha256sums=('SKIP')


pkgver() {
  cd "${srcdir}/${_gitname}"
  git describe --always | sed 's|-|.|g'
}

package() {
  cd "${srcdir}/${_gitname}"
  install -D -m 755 visualpdfdiff.sh "${pkgdir}/usr/bin/visualpdfdiff.sh"
  install -D -m 644 README.md "${pkgdir}/usr/share/visual-pdf-diff/README.md"
}

