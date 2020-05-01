# Maintainer: Solomon Choina <shlomochoina@gmail.com>
pkgname=terminus-terminal-bin
_pkgname=terminus
pkgver=1.0.108
pkgrel=1
pkgdesc="A terminal for a more modern age"
arch=('x86_64')
url="https://github.com/Eugeny/terminus"
license=('MIT')
depends=('nodejs')
provides=("terminus-terminal")
conflicts=("terminus-terminal")
replaces=('terminus-terminal')
source=("$url/releases/download/v${pkgver}/${_pkgname}-${pkgver}-linux.deb")
sha256sums=('aff32e85a51d4787d6de8b36cf8130cf2910ad341e08e51fc4086dbafb5e6fe7')


package() {
  cd "$srcdir/"
  tar -xf data.tar.xz
  cp -r usr/ $pkgdir
  cp -r opt/ $pkgdir

 install -Dm755 /dev/stdin "$pkgdir"/usr/bin/$_pkgname <<END
  #!/usr/bin/bash
  /opt/Terminus/terminus

END

}
