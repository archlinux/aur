# Maintainer: Solomon Choina <shlomochoina@gmail.com>
pkgname=kawanime
pkgver=0.1.1
pkgrel=3
pkgdesc="Desktop app for anime fans"
arch=('x86_64')
url="https://github.com/Kylart/KawAnime"
license=('MIT')
depends=('nodejs')
#dpkg is not actually needed, it's just to avoid a build failure
source=("https://github.com/Kylart/$pkgname/releases/download/v${pkgver}/${pkgname}_${pkgver}_amd64.deb")
sha256sums=('0118515812b5f6d549eb258667516393d686b7d93326ee58cdbb11d3921a28ee')

package() {
	cd "$srcdir/"
  ar x *.deb
  tar -xf data.tar.xz
  mv usr "${pkgdir}"
  mv opt "${pkgdir}"

  install -Dm755 /dev/stdin "$pkgdir"/usr/bin/$pkgname <<END
  #!/usr/bin/bash
  /opt/Kawanime/kawanime

END
}
