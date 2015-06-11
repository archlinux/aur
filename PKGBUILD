# Maintainer: Chad "crossroads1112" Sharp <crossroads1112@riseup.net>
pkgname=open-dyslexic-fonts
pkgver=r148.27a457b
pkgrel=1
pkgdesc="A set of fonts developed with improved readability for dyslexics in mind."
arch=('any')
url="http://dyslexicfonts.com/"
license=('CC-By 3.0')
depends=('fontconfig')
makedepends=('git')
source=(git+https://github.com/antijingoist/open-dyslexic.git)
install=open-dyslexic-fonts.install
md5sums=(SKIP)

pkgver() {
  cd "open-dyslexic"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
package() {
  cd "$srcdir/open-dyslexic/otf"
  mkdir -p ${pkgdir}/usr/share/fonts/open-dyslexic
  for i in ./*.otf; do
      install -m644 $i ${pkgdir}/usr/share/fonts/open-dyslexic || return 1
  done
}
