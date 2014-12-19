# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgname=diffxml
pkgver=0.96B
pkgrel=1
pkgdesc="Tools for comparing and patching XML files"
arch=('any')
url="http://diffxml.sourceforge.net"
license=('GPL')
depends=('java-runtime')
makedepends=('apache-ant')
source=(http://sourceforge.net/projects/diffxml/files/$pkgname/0.96%20BETA/$pkgname-$pkgver.tar.gz)
md5sums=('9fb4bd8b2861d14edccc45ad143011be')

package() {
  cd "${srcdir}"/$pkgname

  ant -Dinstall.dir="${pkgdir}/usr" install
  sed -i "s:/build/diffxml/pkg/diffxml/:/:g" "${pkgdir}"/usr/bin/{diffxml,patchxml}
}
