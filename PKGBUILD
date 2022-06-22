# Maintainer: Erde <erkkah@gmail.com>
# Maintainer: Solomon Choina <shlomochoina@gmail.com>
# Contributor: Solomon Choina <shlomochoina@gmail.com>
pkgname=tabby-bin
_pkgname=tabby
pkgver=1.0.181
pkgrel=1
pkgdesc="Tabby (formerly Terminus) is a highly configurable terminal emulator, SSH and serial client for Windows, macOS and Linux"
arch=('x86_64')
url="https://github.com/Eugeny/tabby"
license=('MIT')
depends=('nodejs')
optdepends=('gnome-keyring')
provides=("tabby")
conflicts=("tabby")
replaces=('tabby')
source=("tabby-${pkgver}-linux.pacman::$url/releases/download/v${pkgver}/${_pkgname}-${pkgver}-linux-x64.pacman")
sha256sums=('7e4feec0ee596957c0e4fc5621cd6e0978440b581e856d8e1f3ffcae806cd59d')

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
