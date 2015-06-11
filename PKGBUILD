# $Id$
# Maintainer: Benjamin Robin <dev@benjarobin.fr>

pkgname=eclipse-subversive-svn-connector
pkgver=5.0.0.I20150529_1700
pkgrel=1
_pluginver=5.0.0.I20150529_1700
pkgdesc="Subversive SVN Connectors"
arch=('any')
url="http://www.polarion.com/products/svn/subversive.php"
license=('EPL')
depends=('eclipse-subversive')

source=("$pkgname-$pkgver-feature.jar::http://community.polarion.com/projects/subversive/download/eclipse/5.0/update-site/features/org.polarion.eclipse.team.svn.connector_${pkgver//_/-}.jar" \
        "$pkgname-$pkgver-plugin.jar::http://community.polarion.com/projects/subversive/download/eclipse/5.0/update-site/plugins/org.polarion.eclipse.team.svn.connector_${_pluginver//_/-}.jar")

noextract=($pkgname-$pkgver-{feature,plugin}.jar)
md5sums=('d9e4b67abb7f1b123044f438ed8a3315'
         'b7d316b3ad7724ff2242ef09189cbf60')
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

