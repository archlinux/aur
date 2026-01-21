# Maintainer: Trix <admin@trix.is-a.dev>
# Contributor:  GasparVardanyan <gaspar_pm@proton.me>
pkgname='awcc-bin'
pkgrel=1
pkgver=1.16.9
pkgdesc="An unofficial alternative to Alienware Command Centre of Windows for the Dell G series"
arch=('x86_64')
url="https://github.com/tr1xem/AWCC"
license=('GPL3')
depends=('acpi_call-dkms'  'libx11' 'systemd-libs' 'glibc'  'glu' 'libglvnd')
provides=("awcc")
conflicts=('awcc-git')
install='awcc.install'
source=("AWCC-v${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/AWCC-v${pkgver}.tar.gz")
sha256sums=('e6245cbf1d364d2fbe6bca01ca500677359976716abf844e74a52f064ce8a8cc')

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
