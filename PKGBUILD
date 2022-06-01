# Contributor: zoe <chp321 [at] gmail (dot) com>
# Maintainer: zoe <chp321 [at] gmail (dot) com>

pkgname=audio-offset-finder
pkgver=1.0
pkgrel=2
pkgdesc="${pkgname} is used to replace the audio of a video to another audio recordered in another device"
arch=('any')
url="https://github.com/abramhindle/${pkgname}"
license=("Apache License v2.0")
depends=('ffmpeg' 'python-scipy>=0.12.0' 'python-matplotlib' 'python-librosa' 'python-numpy')
makedepends=('python-pip')
source=('git+https://github.com/abramhindle/audio-offset-finder.git')
md5sums=(SKIP)

package() {
  cd "${srcdir}"/${pkgname}
  pip install --root "${pkgdir}/" .
  install -D "${srcdir}"/${pkgname}/COPYING "${pkgdir}"/usr/share/licenses/${pkgname}/COPYING
  install -D "${srcdir}"/${pkgname}/AUTHORS "${pkgdir}"/usr/share/doc/${pkgname}/AUTHORS
  install -D "${srcdir}"/${pkgname}/README.md "${pkgdir}"/usr/share/doc/${pkgname}/README.md
}

