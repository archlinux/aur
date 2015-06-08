# Maintainer: Rodrigo Bezerra <rodrigobezerra21 at gmail dot com>
# Contributor: Nathan Owe <ndowens.aur at gmail dot com>

pkgname=drjava
pkgver=20140826
_realver=stable-${pkgver}-r5761
pkgrel=1
pkgdesc="A lightweight development environment for writing Java programs"
arch=('any')
url="http://www.drjava.org/"
license=('BSD')
depends=('bash' 'java-environment')
source=(http://downloads.sourceforge.net/sourceforge/drjava/drjava-${_realver}.jar
        'drjava.sh' 'drjava.desktop' 'LICENSE')
md5sums=('b637ffbab909fc8c03f333d55bc59237'
         'a57baea903b23dc546d8ad0ec016ec93'
         'df1e9a8e696b70ad57b1adc33a1ea19a'
         '2108800ef4928c954af10f1c44bcddfd')

package()
{
  cd ${srcdir}/

  install -d ${pkgdir}/usr/share/{java/${pkgname},licenses/${pkgname}}
  install -Dm644 drjava-${_realver}.jar ${pkgdir}/usr/share/java/${pkgname}/drjava.jar
  install -Dm755 drjava.sh ${pkgdir}/usr/bin/drjava
  install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
  install -Dm644 edu/rice/cs/drjava/ui/icons/drjava64.png ${pkgdir}/usr/share/pixmaps/drjava.png
  install -Dm644 drjava.desktop ${pkgdir}/usr/share/applications/drjava.desktop
}
