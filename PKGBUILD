# Maintainer: Rodrigo Bezerra <rodrigobezerra21 at gmail dot com>
# Contributor: Nathan Owe <ndowens.aur at gmail dot com>

pkgname=drjava
pkgver=20190813
_realver=beta-${pkgver}-220051
pkgrel=1
pkgdesc="A lightweight development environment for writing Java programs"
arch=('any')
url="http://www.drjava.org/"
license=('BSD')
depends=('bash' 'java-environment')
source=(https://sourceforge.net/projects/drjava/files/1.%20DrJava%20Stable%20Releases/drjava-${_realver}/drjava-${_realver}.jar
        'drjava.sh' 'drjava.desktop' 'LICENSE')
sha1sums=('8490e4a9ddaee547abd0f8bc35574d98ad9dcaec'
          '1a1ce3f158a582af1db06b8b011825bc853573c9'
          '14a19a5bda1abdaff3764e66ce0880326714877f'
          'eb6086dad252c561cbc1faa59cb2b78cfa586844')

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
