# Maintainer: Jesus Martin Ortega Martinez (madara125) <martin.ortega.arashi@gmail.com><jortega@condorbs.net>
# Contributor: Kevin Muñoz (MrHacker) <kmunoz@condorbs.net><david.munozm@proton.me>
pkgname=wazuh-indexer
pkgver=4.10.0
_remRevision=1
_prodver=${pkgver}-${_remRevision}
pkgrel=1
pkgdesc="Wazuh Indexer for Arch Linux"
arch=('x86_64')
url="https://wazuh.com/"
license=('gpl2')
groups=("wazuh-siem")
depends=(
    'coreutils'
);
optdepends=(
);
validpgpkeys=(
)

source=(
  "https://packages.wazuh.com/4.x/yum/${pkgname}-${_prodver}.x86_64.rpm"
)

backup=(
  'etc/wazuh-indexer/opensearch.yml'
  'etc/wazuh-indexer/certs'
  'etc/wazuh-indexer/opensearch.keystore'
  )

sha512sums=('adb0159ed7add022e49dcd108b5bc080da643c6919f6a80ac3b4302261489fe95c69dacbc9791090237a8b8c0dd53b02b785a5e1b2e1685ccb432c281b46efb5')

install=$pkgname.install

package() {

    #Setup
    cd $pkgdir
    mv $srcdir/etc .
    mv $srcdir/usr .
    mv $srcdir/var .
    
    #Set systemd service file perms
    chmod 644 $pkgdir/usr/lib/systemd/system/wazuh-indexer-performance-analyzer.service
    chmod 644 $pkgdir/usr/lib/systemd/system/wazuh-indexer.service
}
