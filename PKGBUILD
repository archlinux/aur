# Maintainer: Martin Sandsmark <martin.sandsmark@kde.org>

pkgname=quill-stroker-git
pkgver=r57.dbbbc04
pkgrel=1
pkgdesc='Quill is simple library for stroking along paths with variable width'
arch=('any')
url='https://github.com/CrimsonAS/quill'
license=('BSD')
makedepends=('git')
conflicts=(quill-stroker)
provides=(quill-stroker)
source=('git+https://github.com/CrimsonAS/quill.git' 'LICENSE')
md5sums=('SKIP' '1b1ffb9308412ae949cb7dee02f293fa')

pkgver() {
  cd quill
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  install -Dm 0644 LICENSE -t "${pkgdir}/usr/share/licenses/quill-stroker-git"

  cd quill
  install -Dm 0644 include/*.h -t "${pkgdir}/usr/include/"
}
