# Contributor: A. Klitzing <andre () incubo () de>
pkgname=cppncss
pkgver=1.0.3
pkgrel=2
pkgdesc="various measurements by statically analyzing C++ source code"
arch=('i686' 'x86_64')
url="http://cppncss.sourceforge.net"
license=('BSD')
depends=('java-environment>=5')
source=(http://downloads.sourceforge.net/project/cppncss/cppncss/$pkgver/cppncss-$pkgver.tar.gz $pkgname.sh)

package()
{
  cd "$srcdir/$pkgname-$pkgver"

  # install profile.d script
  install -dm755 ${pkgdir}/etc/profile.d
  install -m755 ${srcdir}/${pkgname}.sh ${pkgdir}/etc/profile.d/

  # install cppncss
  install -dm755 ${pkgdir}/usr/share/java/${pkgname}/{bin,lib}
  install -m755 bin/cppncss ${pkgdir}/usr/share/java/${pkgname}/bin
  install -m644 lib/*.jar ${pkgdir}/usr/share/java/${pkgname}/lib

  #install license
  install -dm755 ${pkgdir}/usr/share/licenses/${pkgname}
  install -m644 LICENSE.txt ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}

md5sums=('1f064bf6e2e6ba7bd4d8a6a7bde8b364'
         '4e4708a0ed13cbc80d53162fec99236c')
