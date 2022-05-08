# Contributor: zoe <chp321 [at] gmail (dot) com>
# Maintainer: zoe <chp321 [at] gmail (dot) com>

pkgname=audio-offset-finder
pkgver=0.5.0
pkgrel=2
pkgdesc="${pkgname} is a simple tool CLI for finding the offset of an audio file within another file. Can help to post-synchronize audio on a video "
arch=('any')
url="https://github.com/bbc/${pkgname}"
license=("Apache License v2.0")
depends=('ffmpeg' 'python-scipy>=0.12.0' 'python-matplotlib' 'python-librosa')
makedepends=('python-pip')
source=('git+https://github.com/bbc/audio-offset-finder.git')
md5sums=(SKIP)

package() {
  cd "${srcdir}"/${pkgname}
  pip install --root "${pkgdir}/" .
  mv ${pkgdir}/usr/bin/executable-name ${pkgdir}/usr/bin/${pkgname}
  install -D "${srcdir}"/${pkgname}/COPYING "${pkgdir}"/usr/share/licenses/${pkgname}/COPYING
  install -D "${srcdir}"/${pkgname}/AUTHORS "${pkgdir}"/usr/share/doc/${pkgname}/AUTHORS
  install -D "${srcdir}"/${pkgname}/README.md "${pkgdir}"/usr/share/doc/${pkgname}/README.md
}
