# Contributor: DonVla <donvla@users.sourceforge.net>
# Maintainer: Jenya Sovetkin <e dot sovetkin at gmail dot com>

pkgname=gt5
pkgver=1.4.0
pkgrel=4
pkgdesc="Reformats 'du'-output to HTML and displays it with a textbrowser like 'links'"
arch=('i686' 'x86_64')
url="http://gt5.sourceforge.net"
license=('GPL')
depends=('awk')
optdepends=("links: textbrowser to navigate through the results")
source=("http://downloads.sourceforge.net/${pkgname}/${pkgname}-${pkgver}.tar.gz" "handle_depth.patch")
md5sums=('b523aa915cbac2efe3e355895de21496'
         '8314de857db601e09132ae1de676e678')
sha256sums=('785a2a71f77e29d2cf4bbd2c6f49f690d6fdcb5f53abd51aee393572fd7fa03e'
            '8bfa694479079dfea1e4dd4623701d5657bb0f06e4af788388f3619af822ce4f')

package() {
  cd ${srcdir}/${pkgname}-${pkgver}
  install -D -m755 ${pkgname} ${pkgdir}/usr/bin/${pkgname}
  patch ${pkgdir}/usr/bin/${pkgname} ${srcdir}/handle_depth.patch
  install -D -m644 ${pkgname}.1 ${pkgdir}/usr/share/man/man1/${pkgname}.1
}
