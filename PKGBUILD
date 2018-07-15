# Maintainer: Damjan Georgievski <gdamjan@gmail.com>
pkgname=nextcloud-uwsgi-service
pkgver=0.1
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

sha256sums=('7ba805c58ae7ad71ea481756da2627108d4078964ec38ff0ee19d836450536de'
            'd92684d644e7d664e2eabbefc874f542869872dc4a772d43b2d0c2e1023e5fa8'
            'ca8103dd4634fb72fb01142646026d8c7e74fff8990b6f607145e070c16aba87'
            '5afe895025e7e14c98cdf1697103dcf132f495730262ee459581b914144ecc52')
