#
# PKGBUILD: cpuid
#
# Maintainer: Uffe Jakobsen <uffe@uffe.org>
# Past Maintainer: Jianing Yang <jianingy.yang @gmail.com>
# Contributor: David Zaragoza <david@zaragoza.com.ve>

pkgname=cpuid
pkgver=20211129
pkgrel=1
pkgdesc="Linux tool to dump x86 CPUID information about the CPU(s)"
url="http://www.etallen.com/cpuid.html"
license=('GPL')
arch=('i686' 'x86_64')
makedepends=('perl')
depends=('glibc' 'perl')
groups=('system')
source=("http://www.etallen.com/$pkgname/${pkgname}-${pkgver}.src.tar.gz")
sha256sums=('230772bb88c44732e68a42d2eff43bcff46d893bf4ea6e04151d4cb6e8c88e2f')

#
#
#
build()
{
  cd "${srcdir}/${pkgname}-${pkgver}" || exit 1
  # pod2man: /usr/bin/core_perl/ is not always in path - minimize error reports by setting PATH
  PATH=${PATH}:/usr/bin/core_perl/
  make || exit 1
}

#
#
#
package()
{
  cd "${srcdir}/${pkgname}-${pkgver}" || exit 1
  make BUILDROOT=${pkgdir} install || exit 1
}

#
# EOF
#
