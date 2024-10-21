# Maintainer Adam Perkowski <adas1per@protonmail.com>
# Maintainer Adrian Woźniak <adrian.wozniak@ita-prog.pl>

pkgname=amdguid-wayland-bin
pkgver=1.0.13
pkgrel=1
pkgdesc="AMDGPU temperature and fan speed monitoring tool"
url="https://github.com/Eraden/amdgpud"
license=('MIT' 'Apache-2.0')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Eraden/amdgpud/releases/download/v1.0.12/amdguid-wayland-archlinux-latest-${pkgver}.zip")
arch=('x86_64')
md5sums=('ce25a6c319f0cf839e20a70547619622')
keywords=('amdgpu' 'controller' 'fan' 'overclocking' 'voltage')
depends=('amdfand')
makedepends=('tar')
optdepends=('amdmond' 'amdvold')
provides=('amdguid-wayland' 'amdguid')

package() {
    mkdir -p "$pkgdir/usr/bin"
    mkdir -p "$pkgdir/usr/lib/systemd/system"
    install -m 0755 "$srcdir/target/release/amdguid-wayland" "$pkgdir/usr/bin"
    install -m 0755 "$srcdir/target/release/amdgui-helper" "$pkgdir/usr/bin"
    install -m 0755 "$srcdir/services/amdgui-helper.service" "$pkgdir/usr/lib/systemd/system/amdgui-helper.service"
}
