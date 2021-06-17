# Maintainer lsdaniel <lsdaniel zero one at gee mail dot com>

pkgname=openssh-socket-activation
pkgver=1.0
pkgrel=1
pkgdesc='systemd socket activation for openssh server'
url='https://www.openssh.com/portable.html'
license=('GPL')
arch=('any')
depends=(openssh systemd)
source=(
    'sshd@.service'
    'sshd.socket'
)
sha256sums=('3a0845737207f4eda221c9c9fb64e766ade9684562d8ba4f705f7ae6826886e5'
            'de14363e9d4ed92848e524036d9e6b57b2d35cc77d377b7247c38111d2a3defd')

package() {
	install -Dm644 sshd@.service "${pkgdir}"/usr/lib/systemd/system/sshd@.service
	install -Dm644 sshd.socket "${pkgdir}"/usr/lib/systemd/system/sshd.socket
}
