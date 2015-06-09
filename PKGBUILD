# Maintainer: "UnCO" Lin <trash__box <_[at]_> 163.com>
pkgname=hoedown-git
_pkgname=hoedown
pkgver=527
pkgrel=1
pkgdesc="Hoedown is a revived forkof Sundown, the Markdown parser based on the original code of the Upskirt library by Natacha Porté."
arch=('any')
url="https://github.com/hoedown/hoedown"
license=('ISC')
conflicts=('sundown-git')
makedepends=('git')
source=('hoedown.pc'
        "git+https://github.com/${_pkgname}/${_pkgname}.git")
md5sums=('baffb7d05f3b0c75a7213d95a006f72d'
         'SKIP')

pkgver() {
  cd $_pkgname
  git rev-list --count HEAD
}

build() {
  cd $_pkgname
  make PREFIX=/usr
}

package() {
  cd $_pkgname
  make PREFIX=/usr DESTDIR="$pkgdir" install
  # install -D -m644 LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
  # install -D -m755 smartypants "${pkgdir}"/usr/bin/smartypants
  # install -D -m755 hoedown "${pkgdir}"/usr/bin/hoedown
  # install -D -m755 libhoedown.so.3 "${pkgdir}"/usr/lib/libhoedown.so.3
  # ln -rs "${pkgdir}"/usr/lib/libhoedown.so.3 "${pkgdir}"/usr/lib/libhoedown.so
  # install -d "${pkgdir}"/usr/include/hoedown
  # cp src/*.h "${pkgdir}"/usr/include/hoedown/
  # install -D -m644 "${srcdir}"/hoedown.pc "${pkgdir}"/usr/share/pkgconfig/hoedown.pc
}
