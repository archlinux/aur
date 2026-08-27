# Maintainer: Julian Corbet <julian.corbet@gmail.com>
# Prebuilt with RUSTFLAGS="-C target-cpu=x86-64-v3" -- targets x86-64-v3 microarchitecture
# (Haswell/Excavator and newer). Links the SYSTEM libpam (required for the greeter/unlock
# path), so this package is Arch-native rather than a static/musl build.
pkgname=nixlock-bin
pkgver=0.1.4
pkgrel=1
pkgdesc="A Wayland session locker that keeps kiosk outputs live while locking the rest, with PAM unlock (prebuilt, x86-64-v3)"
arch=('x86_64')
url="https://github.com/julian-corbet/nixlock-corbet-ch"
license=('MIT')
depends=('pam' 'wayland' 'libxkbcommon')
provides=('nixlock')
conflicts=('nixlock')
source=("https://github.com/julian-corbet/nixlock-corbet-ch/releases/download/v${pkgver}/nixlock-${pkgver}-x86_64-v3.tar.gz")
sha256sums=('9f732037c5835326467d5d077b58ae2707c1ca45542ebe8c334191f10fa52ee4')

package() {
    install -Dm755 nixlock "$pkgdir/usr/bin/nixlock"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
