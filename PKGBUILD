pkgname=lbry-vault
pkgver=3.3.8.2
pkgrel=1
pkgdesc='The LBRY Vault for Ledger'
arch=('x86_64')
url='https://github.com/LBRYFoundation/LBRY-Vault'
license=('MIT')
source=("https://github.com/LBRYFoundation/LBRY-Vault/releases/download/$pkgver/lbry-vault-$pkgver-x86_64.AppImage")
sha512sums=('624a321e08e381a2857d788cabf11bbf06da1170b067413ebe67fbf5544b60d4405dcce67a8c0e093fbab7ab1a66186b4619902de785b4df825f4c9abadc51bc')
build() {
  # Extract files
  chmod +x "$srcdir/lbry-vault-$pkgver-x86_64.AppImage"
  $srcdir/lbry-vault-$pkgver-x86_64.AppImage --appimage-extract
}

package() {
  install -d "$pkgdir/opt/lbry-vault"
  cp -a "$srcdir/squashfs-root/." "$pkgdir/opt/lbry-vault/"
  chmod -R +rx "$pkgdir/opt/lbry-vault"
}

