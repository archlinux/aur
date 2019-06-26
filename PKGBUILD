# Maintainer: Dobroslaw Kijowski <dobo90_at_gmail.com>

pkgname=gede
pkgver=2.14.1
pkgrel=1
pkgdesc='Graphical frontend (GUI) to GDB written in Qt.'
arch=(i686 x86_64)
url='http://acidron.com/gede'
license=(BSD)
depends=(qt5-base gdb ctags)
makedepends=(python2)
source=("http://gede.acidron.com/uploads/source/${pkgname}-${pkgver}.tar.xz")
md5sums=('f5951f8043216dcb6226878d827d0171')

build()
{
  cd "${srcdir}/${pkgname}-${pkgver}"

  python2 build.py --use-qt5
}

package()
{
  cd "${srcdir}/${pkgname}-${pkgver}"

  python2 build.py install --prefix="${pkgdir}/usr" install

  cd "${srcdir}/${pkgname}-${pkgver}"

  install -d -m 755 "${pkgdir}/usr/share/licenses/${pkgname}"
  install -D -m 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
