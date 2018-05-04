# Maintainer: Baplar <baplar@gmail.com>
# Contributor: Drew Noel <drewmnoel@gmail.com>
pkgname=jpf-core-bin
pkgver=r32
pkgrel=1
pkgdesc="An extensible software model checking framework for Java bytecode programs"
arch=('any')
url="https://babelfish.arc.nasa.gov/trac/jpf/wiki/projects/jpf-core"
license=('APACHE')
depends=('java-environment-openjdk>=8')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
source=('https://babelfish.arc.nasa.gov/trac/jpf/raw-attachment/wiki/projects/jpf-core/jpf-core-r32.zip'
		'jpf'
		'jpf.properties')
md5sums=('a9a3cff397180a533a93fd434241a225'
		 '85a27d09ee9ec6137d5f7c43180c87e0'
		 '31708844142d0b48a3227b113db0cb0f')

JPF_HOME=/usr/share/java/jpf
BIN_DIR=/usr/local/bin

package() {
	cd $srcdir

	# Copy the mandatory config
	install -D -m644 -t $pkgdir/$JPF_HOME/ jpf.properties

	# Copy all the .JAR files
	install -D -m644 -t $pkgdir/$JPF_HOME/ jpf-core/build/*.jar

	# Copy the jpf executable
	install -D -m755 -t $pkgdir/$BIN_DIR/ jpf
}
