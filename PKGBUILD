# Maintainer: Erde <erkkah@gmail.com>
# Contributor: Solomon Choina <shlomochoina@gmail.com>
pkgname=tabby-bin
_pkgname=tabby
pkgver=1.0.151
pkgrel=1
pkgdesc="Tabby (formerly Terminus) is a highly configurable terminal emulator, SSH and serial client for Windows, macOS and Linux"
arch=('x86_64')
url="https://github.com/Eugeny/tabby"
license=('MIT')
depends=('nodejs')
provides=("tabby")
conflicts=("tabby")
replaces=('tabby')
source=("$url/releases/download/v${pkgver}/${_pkgname}-${pkgver}-linux.deb")
sha256sums=('6c8d5a3576742e2931a43612c23f426763906898ad6881cce147e8e81dcacd15')

prepare() {
msg "Initiating build"
}

 msg "Removing redundant .deb file"
 rm "${_pkgname}-${pkgver}-linux.deb"

package() {
  cd "$srcdir/"
  tar -xf data.tar.xz
  cp -r usr/ $pkgdir
  cp -r opt/ $pkgdir

 install -Dm755 /dev/stdin "$pkgdir"/usr/bin/$_pkgname <<END
  #!/usr/bin/bash
  /opt/Tabby/tabby

END

}

