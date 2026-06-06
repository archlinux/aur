# Maintainer: TheOddCell <rayfb.to.1@gmail.com>
pkgname=probed-git
pkgver=r10.c0b6060
pkgrel=1
pkgdesc="Public Resource Overseeing and Broadcasting Endpoint Daemon"
arch=('any')
url="https://github.com/oversea-suite/PROBEd"
license=('LGPLv2.1')
depends=('bash' 'python')
provides=('probed')
conflicts=('probed')
source=("git+https://github.com/oversea-suite/PROBEd.git")
sha256sums=('SKIP')

pkgver() {
    cd PROBEd
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd PROBEd
    install -Dm755 probed          "$pkgdir/usr/bin/probed"
    install -Dm755 getinfo.sh      "$pkgdir/var/lib/probed/getinfo.sh"
    install -Dm644 probed.service  "$pkgdir/usr/lib/systemd/system/probed.service"
    install -Dm644 probed.conf     "$pkgdir/etc/probed.conf"
    install -Dm644 LICENSE         "$pkgdir/usr/share/licenses/probed-git/LICENSE"
}
