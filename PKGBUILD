# Contributor: [Vitaliy Berdinskikh](mailto:ur6lad@archlinux.org.ua) aka UR6LAD

pkgname=apache-ivy
pkgver=2.4.0
pkgrel=1
pkgdesc="The agile dependency manager"
arch=('i686' 'x86_64')
url="http://ant.apache.org/ivy/"
license=('Apache')
depends=('apache-ant')
source=(http://mirror.ventraip.net.au/apache/ant/ivy/${pkgver//_/-}/${pkgname}-${pkgver//_/-}-bin.tar.gz ivy.sh)

package() {
	mkdir -p ${pkgdir}/usr/{bin,share/java/apache-ivy,share/java/apache-ant}
	#mkdir -p ${pkgdir}/usr/share/licenses/apache-ant

	cd ${srcdir}

	install -m 644 ${pkgname}-${pkgver//_/-}/ivy-${pkgver//_/-}.jar $pkgdir/usr/share/java/apache-ivy
	install -m 755 ivy.sh $pkgdir/usr/bin/ivy

	ln -s ivy-${pkgver//_/-}.jar ${pkgdir}/usr/share/java/apache-ivy/ivy.jar
	ln -s ../apache-ivy/ivy-${pkgver//_/-}.jar ${pkgdir}/usr/share/java/apache-ant/ivy.jar
}

sha1sums=('97a206e3b6ec2ce9793d2ee151fa997a12647c7f'
          'e7889030dd6d4ca4cd479e37afa808b4b15196cf')
