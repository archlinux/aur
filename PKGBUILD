# Maintainer: akku <akkun11.open (at) gmail.com>

pkgname=auto-aur-keyring
pkgver=20240923
pkgrel=1
pkgdesc="Auto-AUR keyring"
arch=(any)
url="https://auto-aur.pages.dev"
license=('GPL-3.0-or-later')
install=$pkgname.install
source=(
  "auto-aur.gpg"
  "auto-aur-revoked"
  "auto-aur-trusted"
  "$install"
)

sha256sums=(
  "fb3138af7f9245de38749ffef6746d42c06085f358289424f51eca2c0862957c"
  "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"
  "3d020be3be82dcdd98d008234a39f4fddd7ee9aa17c0ed3293b97a639a2e23b6"
  "d1f820481434a9b0fe8a4690c2a1f739dddf6f518bbb881607ffab55f77f22bb"
)

package() {
    install -D -m0644 -t "${pkgdir}"/usr/share/pacman/keyrings/ 'auto-aur'{.gpg,-trusted,-revoked}
}
