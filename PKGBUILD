pkgname=whatsie
pkgver=2.1.0
pkgrel=683
pkgdesc="A simple & beautiful desktop client for WhatsApp Web."
arch=('x86_64')
url="https://whatsie.chat/"
license=('MIT')
depends=('desktop-file-utils' 'gconf' 'gtk2' 'gvfs' 'hicolor-icon-theme' 'libgudev' 'libgcrypt' 'libnotify' 'libxtst' 'nss' 'python' 'xdg-utils' 'libcap' )
optdepends=('hunspell: spell check' )
options=('!docs' '!emptydirs')
install=$pkgname.install
source=("https://dl.bintray.com/aluxian/aur/dist/whatsie-2.1.0-linux-amd64.deb")
validpgpkeys=('6DDA23616E3FE905FFDA152AE61DA9241537994D')
md5sums=('d2e5cb515503cb9e4ae2f574992772c0')
package() {
  msg2 "Extracting the data.tar.gz..."
  bsdtar -xf data.tar.gz -C "$pkgdir/"

  # Link to the binary
  msg2 "Creating symlink..."
  mkdir -p "$pkgdir/usr/bin/"
  ln -s /opt/whatsie/whatsie "$pkgdir/usr/bin/whatsie"
}
