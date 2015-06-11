# Maintainer: Benjamin Robin <benjarobin>

pkgname=eclipse-subversive-svn-connector
pkgver=4.1.3.I20150214_1700
pkgrel=1
_pluginver=4.1.3.I20150214_1700
pkgdesc="Subversive SVN Connectors"
arch=('any')
url="http://www.polarion.com/products/svn/subversive.php"
license=('EPL')
depends=('eclipse-subversive')

source=("$pkgname-$pkgver-feature.jar::http://community.polarion.com/projects/subversive/download/eclipse/4.0/update-site/features/org.polarion.eclipse.team.svn.connector_${pkgver//_/-}.jar" \
        "$pkgname-$pkgver-plugin.jar::http://community.polarion.com/projects/subversive/download/eclipse/4.0/update-site/plugins/org.polarion.eclipse.team.svn.connector_${_pluginver//_/-}.jar")

noextract=($pkgname-$pkgver-{feature,plugin}.jar)
md5sums=('0d126ced1e7455dde98458202a5b1a89'
         'cf4746777c5d5b9caa8c1bbfcdaa233d')
package()
{
	_dest="$pkgdir/usr/share/eclipse/dropins/${pkgname/eclipse-}/eclipse"

	# Feature(s)
	install -d -m755 $_dest/features/org.polarion.eclipse.team.svn.connector_${pkgver//_/-}
	cd $_dest/features/org.polarion.eclipse.team.svn.connector_${pkgver//_/-}
	jar xf $srcdir/$pkgname-$pkgver-feature.jar

	# Plugin(s)
	install -D -m644 $srcdir/$pkgname-$pkgver-plugin.jar $_dest/plugins/org.polarion.eclipse.team.svn.connector_${_pluginver//_/-}.jar
}

