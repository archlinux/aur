# Maintainer: Al rii <alrii@gmail.com>

pkgname=apache-tomcat
pkgver=8.5.23
pkgrel=1
pkgdesc='Open source implementation of the Java Servlet, JavaServer Pages, Java Expression Language and Java WebSocket technologies.'
arch=('any')
url='http://tomcat.apache.org/'
license=('apache')
depends=('jre7-openjdk>=7')
source=("http://apache.mirror.iweb.ca/tomcat/tomcat-8/v${pkgver}/bin/${pkgname}-${pkgver}.tar.gz")
md5sums=('c4addea2c8c166530f11bdeb4730c26e')
sha1sums=('1ba27c1bb86ab9c8404e98068800f90bd662523c')

package() {
        cd "$srcdir"
        install -dm755 "$pkgdir"/opt
        cp --preserve=mode -r "$pkgname-$pkgver" "${pkgdir}/opt/$pkgname-$pkgver"
        install -Dm644 $srcdir/$pkgname-$pkgver/LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
        echo "export JAVA_HOME=/usr/lib/jvm/default" >> ~/.bashrc
        echo "export CATALINA_HOME=/opt/${pkgname}-${pkgver}" >> ~/.bashrc
        echo "**************************************************"
        echo "*****New installation requires system reboot!*****"
        echo "**************************************************"
}
