# Maintainer: Damjan Georgievski <gdamjan@gmail.com>
pkgname=nextcloud-uwsgi-service
pkgver=0.3
pkgrel=1
pkgdesc="run nextcloud as a DynamicUser=yes, socket activated uwsgi service"
arch=('any')
url="https://aur.archlinux.org/packages/nextcloud-uwsgi-service/"
license=('MIT')
depends=('nextcloud>=12.0.0' 'uwsgi-plugin-php' 'systemd' 'nginx')
makedepends=()
options=('!strip')
source=('nginx.conf' 'systemd.service' 'systemd.socket' 'uwsgi.ini')
backup=('etc/uwsgi/nextcloud.ini' 'etc/nginx/sites/nextcloud.conf')

package() {
    install -m0644 -D "${srcdir}"/uwsgi.ini "${pkgdir}"/etc/uwsgi/nextcloud.ini
    install -m0644 -D "${srcdir}"/systemd.service "${pkgdir}"/usr/lib/systemd/system/nextcloud.service
    install -m0644 -D "${srcdir}"/systemd.socket "${pkgdir}"/usr/lib/systemd/system/nextcloud.socket
    install -m0644 -D "${srcdir}"/nginx.conf "${pkgdir}"/etc/nginx/sites/nextcloud.conf
}

sha256sums=('e85b75c603e591608b8b481b0e166e8beff8648894912e2817e0cc14ebe244be'
            'e84895e8d25454a7e7b8d23846e839c5a586faa7b2f8f9f15377b24695e719b1'
            'ca8103dd4634fb72fb01142646026d8c7e74fff8990b6f607145e070c16aba87'
            '5afe895025e7e14c98cdf1697103dcf132f495730262ee459581b914144ecc52')
