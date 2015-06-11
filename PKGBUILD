# Maintainer: Benjamin Robin <benjarobin>

pkgname=eclipse-subversive-svn-connector-svnkit
pkgver=4.1.3.I20150214_1700
pkgrel=1
pkgdesc="Subversive SVN Connectors SVN Kit"
arch=('any')
url="http://www.polarion.com/products/svn/subversive.php"
license=('EPL')
depends=(eclipse-subversive eclipse-subversive-svn-connector)

source=("$pkgname-$pkgver-feature.jar::http://community.polarion.com/projects/subversive/download/eclipse/4.0/update-site/features/org.polarion.eclipse.team.svn.connector.svnkit18_${pkgver//_/-}.jar" \
        "$pkgname-$pkgver-plugin.jar::http://community.polarion.com/projects/subversive/download/eclipse/4.0/update-site/plugins/org.polarion.eclipse.team.svn.connector.svnkit18_${pkgver//_/-}.jar")

noextract=($pkgname-$pkgver-{feature,plugin}.jar)
md5sums=('e3821f6ef6cb1df66b74bdab698bd7e5'
         '1cfe7214916a184a86891e7ed07c730e')

package()
{
    _dest="${pkgdir}/usr/share/eclipse/dropins/${pkgname/eclipse-}/eclipse"

    # Feature(s)
    install -d -m755 $_dest/features/org.polarion.eclipse.team.svn.connector.svnkit_${pkgver//_/-}
    cd $_dest/features/org.polarion.eclipse.team.svn.connector.svnkit_${pkgver//_/-}
    jar xf $srcdir/$pkgname-$pkgver-feature.jar

    # Plugin(s)
    install -D -m644 $srcdir/$pkgname-$pkgver-plugin.jar $_dest/plugins/org.polarion.eclipse.team.svn.connector.svnkit_${pkgver//_/-}.jar
}

