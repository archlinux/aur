# $Id$
# Maintainer: Benjamin Robin <dev@benjarobin.fr>

pkgname=eclipse-subversive-svn-connector
pkgver=6.0.4.I20161211_1700
pkgrel=1
_pluginver=6.0.4.I20161211_1700
pkgdesc="Subversive SVN Connectors"
arch=('any')
url="http://www.polarion.com/products/svn/subversive.php"
license=('EPL')
depends=('eclipse-subversive')

source=("$pkgname-$pkgver-feature.jar::http://community.polarion.com/projects/subversive/download/eclipse/6.0/update-site/features/org.polarion.eclipse.team.svn.connector_${pkgver//_/-}.jar" \
        "$pkgname-$pkgver-plugin.jar::http://community.polarion.com/projects/subversive/download/eclipse/6.0/update-site/plugins/org.polarion.eclipse.team.svn.connector_${_pluginver//_/-}.jar")

noextract=($pkgname-$pkgver-{feature,plugin}.jar)
md5sums=('28478ba79933b6df388d30ef30cd48e0'
         '0b218322753148a06f0c51104354ba0a')
package()
{
	_dest="$pkgdir/usr/lib/eclipse/dropins/${pkgname/eclipse-}/eclipse"

	# Feature(s)
	install -d -m755 $_dest/features/org.polarion.eclipse.team.svn.connector_${pkgver//_/-}
	cd $_dest/features/org.polarion.eclipse.team.svn.connector_${pkgver//_/-}
	jar xf $srcdir/$pkgname-$pkgver-feature.jar

	# Plugin(s)
	install -D -m644 $srcdir/$pkgname-$pkgver-plugin.jar $_dest/plugins/org.polarion.eclipse.team.svn.connector_${_pluginver//_/-}.jar
}

