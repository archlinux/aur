# Contributor: zoe <chp321 [at] gmail (dot) com>
# Maintainer: zoe <chp321 [at] gmail (dot) com>

pkgname=audio-offset-finder
pkgver=0.1
pkgrel=2
pkgdesc="${pkgname} is a simple tool CLI for finding the offset of an audio file within another file."
arch=('any')
url="https://github.com/bbc/${pkgname}"
license=("Apache License v2.0")
depends=('ffmpeg' 'python2-scipy' 'python2-scikits-talkbox')
makedepends=('python2-setuptools')
source=('git+https://github.com/bbc/audio-offset-finder.git')
md5sums=(SKIP)

build() {
  cd "${srcdir}"/${pkgname}
  python2 setup.py build
}

package() {
  cd "$srcdir"/${pkgname}
  python2 setup.py install --root="${pkgdir}/" --optimize=1
  install -D "${srcdir}"/${pkgname}/COPYING "${pkgdir}"/usr/share/licenses/${pkgname}/COPYING
  install -D "${srcdir}"/${pkgname}/AUTHORS "${pkgdir}"/usr/share/doc/${pkgname}/AUTHORS
  install -D "${srcdir}"/${pkgname}/README.md "${pkgdir}"/usr/share/doc/${pkgname}/README.md
}
