# Maintainer: Trix <admin@trix.is-a.dev>
# Contributor:  GasparVardanyan <gaspar_pm@proton.me>
pkgname='awcc-bin'
pkgrel=2
pkgver=1.9.0
pkgdesc="An unofficial alternative to Alienware Command Centre of Windows for the Dell G series"
arch=('x86_64')
url="https://github.com/tr1xem/AWCC"
license=('GPL3')
depends=('acpi_call-dkms' 'libusb' 'libx11' 'systemd-libs' 'glibc' 'glfw' 'glu' 'libglvnd' 'libevdev' 'ttf-roboto')
provides=("awcc")
conflicts=('awcc-git')
install='awcc.install'
source=("AWCC-v${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/AWCC-v${pkgver}.tar.gz")
sha256sums=('c1eea8dd4e6841fae1681f179fff3c4bab097442d838dafe18aa84f613ff7bab')

package() {
    cd "$srcdir/"
    install -Dm755 "./awcc" "$pkgdir/usr/bin/awcc"
    install -Dm644 "./app/awccd.service" "$pkgdir/etc/systemd/system/awccd.service"
    install -Dm644 "./app/70-awcc.rules" "$pkgdir/etc/udev/rules.d/70-awcc.rules"
    install -Dm644 "./app/awcc.png" "$pkgdir/usr/share/icons/awcc.png"
    install -Dm644 "./app/awcc.desktop" "$pkgdir/usr/share/applications/awcc.desktop"
    install -Dm644 "./database.json" "$pkgdir/etc/awcc/database.json"
    install -Dm644 "./LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
