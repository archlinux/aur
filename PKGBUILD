# Maintainer: EMPTY <testerthe60@gmail.com>
pkgname=portmaster-runit
pkgver=0.7.1
pkgrel=1
pkgdesc="Portmaster runit service (does not include portmaster itself)"
arch=("any")
url="https://github.com/0x454d505459/portmaster-runit.git"
license=('GPLv3')
groups=()
depends=("portmaster-stub-bin")
source=("$pkgname-$pkgver.tar.gz::https://codeload.github.com/0x454d505459/portmaster-runit/tar.gz/refs/tags/$pkgver")
md5sums=("SKIP")

package() {
    cd "$pkgname-$pkgver"
    install -D -d "$pkgdir/etc/runit/sv/portmaster"
    cp -a run "$pkgdir/etc/runit/sv/portmaster/"
    msg """For the service to be available threw sv you need to link it first
using the following command:

sudo ln -s /etc/runit/sv/portmaster /run/runit/service/portmaster

You can now start it using sv:
sv up portmaster
""" 
}
