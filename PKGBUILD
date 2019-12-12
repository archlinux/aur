# Maintainer: Solomon Choina <shlomochoina@gmail.com>
pkgname=terminus-terminal-bin
_pkgname=terminus
pkgver=1.0.97
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
sha256sums=('9e2e8a70a65ae940eddba7e11d39999b1c33afdd46789651194176a90e8c3c40')


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
