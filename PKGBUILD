# Maintainer: Joan Figueras <ffigue at gmail dot com>
# Contributor: Black_Codec <orso.f.regna@gmail.com>

pkgname=guacamole-client-bin
pkgver=1.6.0
pkgrel=1
pkgdesc="Apache Guacamole is a clientless remote desktop gateway. It supports standard protocols like VNC, RDP, and SSH. guacamole-client provides the client to be served by your servlet container. Binary prebuilt from Apache."
arch=('any')
url="https://guacamole.apache.org/"
license=('GPL3')
depends=('java-runtime' 'java-environment<=19')
optdepends=('tomcat8: open source Java Servlet container'
            'tomcat9: open source Java Servlet container')
source=("https://archive.apache.org/dist/guacamole/${pkgver}/binary/guacamole-${pkgver}.war"
        "guacamole.properties" "user-mapping.xml")
install=guacamole-client.install
provides=('guacamole-client')
conflicts=('guacamole-client')
replaces=('guacamole-client')
noextract=("guacamole-${pkgver}.war")
backup=('etc/guacamole/guacamole.properties' 'etc/guacamole/user-mapping.xml')

md5sums=('3c7a71667e5747ca8553abff33d12953'
         '1f3ec0a32cc3c6b4f7aeb8a3b2e7531b'
         'c39b825c0ee68a60c42b94ed3d568d64')

backup=('etc/guacamole/guacamole.properties' 'etc/guacamole/user-mapping.xml')

package() {
  mkdir -m 775 -p "${pkgdir}"/usr/share/guacamole/
  mkdir -p "${pkgdir}"/etc/guacamole/
  install -D guacamole-${pkgver}.war "${pkgdir}"/usr/share/guacamole/guacamole.war
  install -D user-mapping.xml "${pkgdir}"/etc/guacamole/
  install -D guacamole.properties "${pkgdir}"/etc/guacamole/
}
