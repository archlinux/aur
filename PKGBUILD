# Maintainer: BarrelGorilla <smartly_dude551@simplelogin.com>
# Contributor: jdev082 <jdev0894@gmail.com>
# Contributor: Erde <erkkah@gmail.com>
# Contributor: Solomon Choina <shlomochoina@gmail.com>
pkgname=tabby-bin
_pkgname=tabby
pkgver=1.0.206
pkgrel=1
pkgdesc="Tabby (formerly Terminus) is a highly configurable terminal emulator, SSH and serial client for Windows, macOS and Linux"
arch=('x86_64')
url="https://github.com/Eugeny/tabby"
license=('MIT')
depends=('nodejs' 'alsa-lib' 'nss')
optdepends=('gnome-keyring')
provides=("tabby")
conflicts=("tabby")
source=("tabby-${pkgver}-linux.pacman::$url/releases/download/v${pkgver}/${_pkgname}-${pkgver}-linux-x64.pacman")
sha256sums=('03d51e18badd22c028d1789120d5dbe004460350bd0fcd04964d56758a42a102')

package() {
  cd "$srcdir/"
  tar -xvf tabby-${pkgver}-linux.pacman -C ${pkgdir}
  # Remove exsiting files
  rm -f ${pkgdir}/.PKGINFO ${pkgdir}/.MTREE ${pkgdir}/.INSTALL

 install -Dm755 /dev/stdin "$pkgdir"/usr/bin/$_pkgname <<END
  #!/usr/bin/bash
  /opt/Tabby/tabby

  chown root:root /opt/Tabby/chrome-sandbox
  chmod 4755 /opt/Tabby/chrome-sandox

END

}
