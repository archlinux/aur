# Maintainer: Dobroslaw Kijowski <dobo90_at_gmail.com>

pkgname=gede
pkgver=1.14.6
pkgrel=1
pkgdesc='Graphical frontend (GUI) to GDB written in Qt.'
arch=(i686 x86_64)
url='http://acidron.com/gede'
license=(BSD)
depends=(qt4 gdb ctags)
makedepends=(python2)
source=("http://gede.acidron.com/uploads/source/${pkgname}-${pkgver}.tar.xz")
md5sums=(dadce66ae85721ad6e51bd4445006ec8)

build()
{
  cd "${srcdir}/${pkgname}-${pkgver}"

  python2 build.py
}

package()
{
  cd "${srcdir}/${pkgname}-${pkgver}"

  python2 build.py install --prefix="${pkgdir}/usr" install

  cd "${srcdir}/${pkgname}-${pkgver}"

  install -d -m 755 "${pkgdir}/usr/share/licenses/${pkgname}"
  install -D -m 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
