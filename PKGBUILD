# Maintainer: Jameson Pugh <imntreal@gmail.com>

pkgname=xsr
pkgver=1.0.0
pkgrel=1
pkgdesc="X Steps Recorder is a clone of PSR for Windows, a program that allows users to make a recording of all of the steps they took."
arch=(any)
url='https://github.com/nonnymoose/xsr'
license=(MIT)
depends=('perl' 'scrot')
optionaldeps=('imagemagick'
              'xdotool')
source=("https://github.com/nonnymoose/xsr/archive/v${pkgver}.tar.gz")
sha256sums=('46cb94d45c90762fa08edcbe2ff03165424978f855c33969062a742b835b2e59')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  
  install -v -m755 -d "${pkgdir}/usr/bin"
  install -v -m755 -d "${pkgdir}/usr/share/xsr"
  install -v -m755 -d "${pkgdir}/usr/share/doc/xsr"
  install -v -m755 xsr "${pkgdir}/usr/share/xsr/"
  install -v -m644 {xsr.css,xsr-min.css} "${pkgdir}/usr/share/xsr/"
  install -v -m644 README.md "${pkgdir}/usr/share/doc/xsr/"
  ln -s /usr/share/xsr/xsr "${pkgdir}/usr/bin/xsr"
}

# vim:set ts=2 sw=2 et:
