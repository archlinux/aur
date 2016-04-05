# Maintainer: Evan Teitelman <teitelmanevan@gmail.com>

pkgname=apache-ant-maven-tasks
pkgver=2.1.3
pkgrel=3
pkgdesc="Maven Ant Tasks"
url="http://maven.apache.org/ant-tasks/download.html"
arch=('any')
license=('Apache')
#depends=('java-runtime' 'apache-ant' 'xerces2-java')
# The source zip file won't extract so we download the pre-built binary instead.
source=("http://archive.apache.org/dist/maven/ant-tasks/${pkgver}/binaries/maven-ant-tasks-${pkgver}.jar")
md5sums=('7ce48382d1aa4138027a58ec2f29beda')

package() {
	cd "$srcdir"

	install -d "$pkgdir/usr/share/java/apache-ant"

	install -m644 "maven-ant-tasks-${pkgver}.jar" "$pkgdir/usr/share/java/apache-ant"
  ln -s "apache-ant/maven-ant-tasks-${pkgver}.jar" "$pkgdir/usr/share/java/maven-ant-tasks.jar"
}
