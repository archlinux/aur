# $Id$
# Maintainer: Benjamin Robin <dev@benjarobin.fr>

pkgname=eclipse-subversive-svn-connector-svnkit
pkgver=5.0.0.I20150529_1700
pkgrel=1
pkgdesc="Subversive SVN Connectors SVN Kit"
arch=('any')
url="http://www.polarion.com/products/svn/subversive.php"
license=('EPL')
depends=(eclipse-subversive eclipse-subversive-svn-connector)

source=("$pkgname-$pkgver-feature.jar::http://community.polarion.com/projects/subversive/download/eclipse/5.0/update-site/features/org.polarion.eclipse.team.svn.connector.svnkit18_${pkgver//_/-}.jar" \
        "$pkgname-$pkgver-plugin.jar::http://community.polarion.com/projects/subversive/download/eclipse/5.0/update-site/plugins/org.polarion.eclipse.team.svn.connector.svnkit18_${pkgver//_/-}.jar")

noextract=($pkgname-$pkgver-{feature,plugin}.jar)
md5sums=('2e699381dded4c7138eca90554df16e3'
         '1fc8242d5aedf9f884c3a97eff01a194')

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
