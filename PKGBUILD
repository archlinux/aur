# original code from fnkr https://stackoverflow.com/questions/37242217/access-docker-container-from-host-using-containers-name
pkgname=docker-hosts-updater
pkgver=0.1
pkgrel=1
pkgdesc="Update Docker containers in /etc/hosts"
arch=('any')
url="https://stackoverflow.com/questions/37242217/access-docker-container-from-host-using-containers-name"
depends=('jq' 'docker')
provides=('docker-update-hosts')
source=('docker-update-hosts' 'docker-update-hosts.service')
md5sums=('6cfa4361c35338d2d85c699f39f0c16b' '3f95b5e61369a9e344cd1500582ec69b')

package() {
    echo "Don't forget to run systemctl daemon-reload and then start this service."
    echo "To enable this service : systemctl enable docker-update-hosts.service."
    echo "To start this service : systemctl start docker-update-hosts.service."
    mkdir -p "${pkgdir}/usr/bin"
    mkdir -p "${pkgdir}/etc/systemd/system"
    cp docker-update-hosts "${pkgdir}/usr/bin/"
    cp docker-update-hosts.service "${pkgdir}/etc/systemd/system/"
}