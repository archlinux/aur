# Maintainer: Al rii <alrii@gmail.com>

pkgname=apache-tomcat
pkgver=8.5.27
pkgrel=1
pkgdesc='Open source implementation of the Java Servlet, JavaServer Pages, Java Expression Language and Java WebSocket technologies.'
arch=('any')
url='http://tomcat.apache.org/'
license=('apache')
depends=('jre7-openjdk>=7')
source=("http://apache.mirror.iweb.ca/tomcat/tomcat-8/v${pkgver}/bin/${pkgname}-${pkgver}.tar.gz")
md5sums=('2d39cb3293ec3308d5235004adf0d134')
sha1sums=('dc63fe7cefd5eb4f746d17b68578acc92e8af576')

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
