# Maintainer: Julian Corbet <julian.corbet@gmail.com>
# Prebuilt with RUSTFLAGS="-C target-cpu=x86-64-v3" -- targets x86-64-v3 microarchitecture
# (Haswell/Excavator and newer). Links the SYSTEM libpam (required for the greeter/unlock
# path), so this package is Arch-native rather than a static/musl build.
pkgname=nixlock-bin
pkgver=0.1.5
pkgrel=1
pkgdesc="A Wayland session locker that keeps kiosk outputs live while locking the rest, with PAM unlock (prebuilt, x86-64-v3)"
arch=('x86_64')
url="https://github.com/julian-corbet/nixlock-corbet-ch"
license=('MIT')
depends=('pam' 'wayland' 'libxkbcommon')
provides=('nixlock')
conflicts=('nixlock')
source=("https://github.com/julian-corbet/nixlock-corbet-ch/releases/download/v${pkgver}/nixlock-${pkgver}-x86_64-v3.tar.gz")
sha256sums=('2aef04ef5bfbddf142167ad1658beb755b4193aeec81fdcd3fc3622c6b9fa8e5')

package() {
    install -Dm755 nixlock "$pkgdir/usr/bin/nixlock"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
