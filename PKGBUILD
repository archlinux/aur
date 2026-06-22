# Maintainer: Philipp Schaffrath <philipp dot schaffrath at gmail dot com>

pkgname=psst-keyring-prompter-bin
pkgver=0.2.0
pkgrel=1
pkgdesc="GNOME Keyring unlock prompt for wayland (layer-shell)."
arch=('x86_64')
url="https://github.com/phisch/psst"
license=('MPL-2.0')
depends=('fontconfig' 'freetype2' 'libxkbcommon' 'wayland' 'vulkan-icd-loader' 'gcc-libs')
optdepends=('gnome-keyring: the keyring daemon this unlocks')
provides=('psst-keyring-prompter')
conflicts=('psst-keyring-prompter')
options=('!strip' '!debug')
source=("$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/psst-v$pkgver-x86_64-linux.tar.gz")
sha256sums=('ce7895f28821b78f0fac3f54c7ce9fb7a8de4f14207192eed1167dcd8e0628f1')

package() {
    cd "$srcdir/psst-v$pkgver-x86_64-linux"
    install -Dm755 psst-keyring-prompter "$pkgdir/usr/bin/psst-keyring-prompter"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 THIRD-PARTY-LICENSES.html "$pkgdir/usr/share/licenses/$pkgname/THIRD-PARTY-LICENSES.html"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
