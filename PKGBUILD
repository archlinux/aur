# Maintainer: Solomon Choina <shlomochoina@gmail.com>
pkgname=kawanime
pkgver=0.1.2
pkgrel=1
pkgdesc="Desktop app for anime fans"
arch=('x86_64')
url="https://github.com/Kylart/KawAnime"
license=('MIT')
depends=('nodejs')
#dpkg is not actually needed, it's just to avoid a build failure
source=("https://github.com/Kylart/$pkgname/releases/download/v${pkgver}/${pkgname}_${pkgver}_amd64.deb")
sha256sums=('e904c5123f782d4177f9a702904b6d4ae1b0090b255a9f8d332a20c2d597b8c3')

package() {
	cd "$srcdir/"
  ar x *.deb
  tar -xf data.tar.xz
  mv usr "${pkgdir}"
  mv opt "${pkgdir}"

  install -Dm755 /dev/stdin "$pkgdir"/usr/bin/$pkgname <<END
  #!/usr/bin/bash
  /opt/KawAnime/kawanime

END
}
