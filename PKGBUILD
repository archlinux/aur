# Maintainer: yaroslav <proninyaroslav@mail.ru>
# Contributor: Eric Ozwigh <com dot gmail at ozwigh>

pkgname=javafx-scenebuilder-bin
pkgver=2.0b20
pkgrel=2
pkgdesc="Visual layout tool that lets users quickly design Java application user interfaces (Oracle binary version)."
provides=scenebuilder
conflicts=scenebuilder
arch=('i686' 'x86_64')
url='http://www.oracle.com'
license=('Oracle BSD License')
makedepends=('wget')
source=("http://download.oracle.com/otn-pub/java/javafx_scenebuilder/2.0-b20/javafx_scenebuilder-2_0-linux-i586.tar.gz")
sha256sums=('80212f7748c2671b89b6085000717c747851db004409dce3bb97f3a2aeb91cdd')
if test "$CARCH" == x86_64; then
	source=("http://download.oracle.com/otn-pub/java/javafx_scenebuilder/2.0-b20/javafx_scenebuilder-2_0-linux-x64.tar.gz")
	sha256sums=('80212f7748c2671b89b6085000717c747851db004409dce3bb97f3a2aeb91cdd')
fi
DLAGENTS=('http::/usr/bin/wget -c --no-check-certificate --no-cookies --header Cookie:\ oraclelicense=accept-securebackup-cookie %u')

package() {
	install -d -m755 "${pkgdir}/opt"
	cp -dr --no-preserve=ownership "${srcdir}/JavaFXSceneBuilder2.0" "${pkgdir}/opt"
	install -d -m755 "${pkgdir}/usr/bin"
	ln -s "/opt/JavaFXSceneBuilder2.0/JavaFXSceneBuilder2.0" "${pkgdir}/usr/bin/scenebuilder"
}
