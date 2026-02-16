pkgname=arch-update-vai
pkgver=0.6.0
pkgrel=1
pkgdesc="Script interativo para atualizar Arch Linux (pacman, AUR, Flatpak, Snap, fwupd)"
arch=('any')
url="https://github.com/CapivaraVai/arch-update-script-vai"
license=('GPL3')
depends=('bash')
optdepends=(
  'yay: suporte a AUR'
  'flatpak: suporte a Flatpak'
  'snapd: suporte a Snap'
  'fwupd: suporte a firmware (fwupdmgr)'
  'reflector: atualizar mirrorlist automaticamente'
  'python: checar pacotes pip'
  'python-pip: checar pacotes pip'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/CapivaraVai/arch-update-script-vai/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')

package() {
  cd "$srcdir/arch-update-script-vai-$pkgver"
  install -Dm755 update-vai.sh "$pkgdir/usr/bin/update-vai"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 CHANGELOG.md "$pkgdir/usr/share/doc/$pkgname/CHANGELOG.md"
}
