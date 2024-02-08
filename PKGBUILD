# Maintainer: Jesus Martin Ortega Martinez (madara125) <martin.ortega.arashi@gmail.com><jortega@condorbs.net>
# Contributor: Kevin Muñoz (MrHacker) <kmunoz@condorbs.net><david.munozm@proton.me>
pkgname=wazuh-filebeat
pkgver=7.10.2
_remRevision=1
_prodver=${pkgver}-${_remRevision}
pkgrel=1
pkgdesc="Filebeat version for Wazuh"
arch=('x86_64')
url="https://wazuh.com/"
license=('gpl2')
depends=(
    'glibc'
    'audit'
    'git'
    'go'
    'libpcap'
    'mage'
    'python-virtualenv'
    'rsync'
    'systemd'
    'python'
);
optdepends=(
    'elasticsearch'
);

conflicts=('filebeat')

validpgpkeys=('9E646BB0630C8FD18ACD15541B93E6A766CD229D')

source=("https://packages.wazuh.com/4.x/yum/filebeat-oss-7.10.2-x86_64.rpm")

backup=(
  'etc/filebeat/filebeat.yml'
  'etc/filebeat/certs'
  )

sha256sums=('56820530dd749d61ba2750ecefc390393a8a5029dd431bf2eaf6a599a847f8f2')

install=$pkgname.install

package() {

    #Setup
    cd $pkgdir
    mv $srcdir/etc .
    mv $srcdir/lib .
    mv $srcdir/usr .

    #Set systemd service file perms
    chmod 644 $pkgdir/lib/systemd/system/filebeat.service
}
