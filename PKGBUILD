# Maintainer: Behnam Momeni <sbmomeni [at the] gmail [dot] com>

pkgname=('pronounce-git')

_gitname=pronounce
#The actual value is calculated by pkgver() function
pkgver=v1.1.0.1.gd18cb7f
pkgrel=1

pkgdesc="A command line interface for English words pronunciation"
url="https://github.com/momeni/${_gitname}"

arch=('any')
license=('GPL3')

depends=('ffmpeg' 'wget' 'coreutils')
optdepends=(
  'w3m: viewing definition of words in w3m; a CLI browser'
  'firefox: viewing definition of words in Mozilla Firefox'
)
conflicts=('pronounce')
provides=('pronounce')
makedepends=('git')
source=('git+https://github.com/momeni/pronounce.git')
sha256sums=('SKIP')


pkgver() {
  cd "${srcdir}/${_gitname}"
  git describe --always | sed 's|-|.|g'
}

package() {
  cd "${srcdir}/${_gitname}"
  install -D -m 755 pronounce "${pkgdir}/usr/bin/pronounce"
  install -D -m 644 README.md "${pkgdir}/usr/share/pronounce/README.md"
}

