#
# Maintainer: Diego Ernani (CapivaraVai) <dernani@gmail.com>
#
#
# Maintainer: Diego Ernani (CapivaraVai) <dernani@gmail.com>
#
pkgname=arch-update-vai-bin
pkgver=0.7.1
pkgrel=1
pkgdesc="Script interativo para atualizar Arch Linux (pacman, AUR, Flatpak, Snap, fwupd)"
arch=('any')
url="https://codeberg.org/CapivaraVai/arch-update-vai"
license=('GPL-3.0-or-later')
depends=('bash')
makedepends=('git')
optdepends=(
  'yay: suporte a AUR'
  'flatpak: suporte a Flatpak'
  'snapd: suporte a Snap'
  'fwupd: suporte a firmware (fwupdmgr)'
  'reflector: atualizar mirrorlist automaticamente'
  'python: checar pacotes pip'
  'python-pip: checar pacotes pip'
)

source=("arch-update-vai::git+https://codeberg.org/CapivaraVai/arch-update-vai.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/arch-update-vai"
  echo "0.7.1.r$(git rev-list --count HEAD)"
}


source=("arch-update-vai::git+https://codeberg.org/CapivaraVai/arch-update-vai.git")

pkgver() {
  cd "$srcdir/arch-update-vai"
  echo "0.7.1.r$(git rev-list --count HEAD)"
}

package() {
  cd "$srcdir/arch-update-vai"

  # binário
  install -Dm755 update-vai.sh "$pkgdir/usr/bin/arch-update-vai"

  # licença
  [[ -f LICENSE ]] && install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # docs
  [[ -f README.md ]] && install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  [[ -f CHANGELOG.md ]] && install -Dm644 CHANGELOG.md "$pkgdir/usr/share/doc/$pkgname/CHANGELOG.md"

  # desktop entry
  install -Dm644 packaging/update-vai.desktop \
    "$pkgdir/usr/share/applications/arch-update-vai.desktop"

  # ícone
  install -Dm644 packaging/update-vai.svg \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/arch-update-vai.svg"
}



