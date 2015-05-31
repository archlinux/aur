# Maintainer: Robert Knauer <robert@privatdemail.net>
# Contributor: Eric Forgeot http://anamnese.online.fr

pkgname=abcpp
pkgver=1.4.5
pkgrel=1
pkgdesc="A simple yet powerful preprocessor designed for, but not limited to, ABC music files"
url="http://abcplus.sourceforge.net"
license=('GPL')
depends=('glibc')
source=(
  "http://abcplus.sourceforge.net/${pkgname}-${pkgver}.tar.gz"
)
arch=('i686' 'x86_64')
sha256sums=(
  'c45a7c3152233dd42970ac146f0e795cd1c6602bbcd1367abcf9cc65ae611183'
)

build()
{
  cd "${srcdir}/${pkgname}-${pkgver}"
  make
}

package()
{
  cd "${srcdir}/${pkgname}-${pkgver}"
  mkdir -p "${pkgdir}/usr/bin/"
  mkdir -p "${pkgdir}/usr/share/abcpp"
  cp abcpp "${pkgdir}/usr/bin/"
  cp -fr *.abp "${pkgdir}/usr/share/abcpp/"
  cp -fr examples "${pkgdir}/usr/share/abcpp/"
  cp -fr docs "${pkgdir}/usr/share/abcpp/"
  chmod -R 744 "${pkgdir}/usr/share/abcpp/"
}
