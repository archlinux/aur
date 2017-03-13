# $Id$
# Maintainer: Benjamin Robin <dev@benjarobin.fr>

pkgname=eclipse-subversive-svn-connector-svnkit
pkgver=6.0.4.I20161211_1700
pkgrel=1
pkgdesc="Subversive SVN Connectors SVN Kit"
arch=('any')
url="http://www.polarion.com/products/svn/subversive.php"
license=('EPL')
depends=(eclipse-subversive eclipse-subversive-svn-connector)

source=("$pkgname-$pkgver-feature.jar::http://community.polarion.com/projects/subversive/download/eclipse/6.0/update-site/features/org.polarion.eclipse.team.svn.connector.svnkit18_${pkgver//_/-}.jar" \
        "$pkgname-$pkgver-plugin.jar::http://community.polarion.com/projects/subversive/download/eclipse/6.0/update-site/plugins/org.polarion.eclipse.team.svn.connector.svnkit18_${pkgver//_/-}.jar")

noextract=($pkgname-$pkgver-{feature,plugin}.jar)
md5sums=('97903d2adad19d567ae907aab1f478fc'
         'ae11c208249513d18be6e21e501a4146')

package()
{
    _dest="${pkgdir}/usr/lib/eclipse/dropins/${pkgname/eclipse-}/eclipse"

    # Feature(s)
    install -d -m755 $_dest/features/org.polarion.eclipse.team.svn.connector.svnkit_${pkgver//_/-}
    cd $_dest/features/org.polarion.eclipse.team.svn.connector.svnkit_${pkgver//_/-}
    jar xf $srcdir/$pkgname-$pkgver-feature.jar

    # Plugin(s)
    install -D -m644 $srcdir/$pkgname-$pkgver-plugin.jar $_dest/plugins/org.polarion.eclipse.team.svn.connector.svnkit_${pkgver//_/-}.jar
}
