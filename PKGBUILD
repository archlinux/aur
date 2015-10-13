# Contributor: Keerthan Jaic <jckeerthan at gmail dot com>
pkgname=brainworkshop
pkgver=4.8.4
pkgrel=4
pkgdesc="Brain Workshop is a free open-source version of the Dual N-Back mental exercise"
arch=('any')
url="http://brainworkshop.sourceforge.net/"
license=('GPL')
depends=('python2' 'python2-pyglet' 'avbin7' 'openal')
install='brainworkshop.install'
source=(http://downloads.sourceforge.net/brainworkshop/$pkgname-$pkgver.zip
        brainworkshop.sh
        brainworkshop.desktop)
sha256sums=('bb1f259eda90e945a803524eedbc0087283e3fb9ae2ab4c16ded88c8c4e95b15'
            '8d27b9055ec21e7b39e91d6b1996573c8ecb2c5fac5ad424be6cd134626ff21f'
            '1e645c18ce0648f82285da25a5bbbad1e63e282bfe9d5c31329eb9d04c23f21c')

package() {

  #Data
  _datadir="${pkgdir}/usr/share/${pkgname}"
  install -d ${_datadir}
  cp -a ${srcdir}/${pkgname}/{brainworkshop.pyw,res,data} ${_datadir}

  #Docs
  _docdir=${pkgdir}/usr/share/doc/${pkgname}
  install -d "${_docdir}"
  install -D -m644 "${srcdir}/${pkgname}/Readme.txt" "${_docdir}"

  #Launcher and Icon
  install -Dm75 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
  install -D -m644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -D -m644 "${srcdir}/${pkgname}/res/misc/brain/brain.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
}
