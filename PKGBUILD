# Maintainer: Solomon Choina <shlomochoina@gmail.com>
pkgname=kawanime
pkgver=0.2.5
pkgrel=1
pkgdesc="Desktop app for anime fans"
arch=('x86_64')
url="https://github.com/Kylart/KawAnime"
license=('MIT')
depends=('nodejs')
#dpkg is not actually needed, it's just to avoid a build failure
source=("https://github.com/Kylart/$pkgname/releases/download/v${pkgver}/${pkgname}_${pkgver}_amd64.deb")
sha256sums=('29338c623221f8ef9c6cb0f0dd9dd0d664fa365ccd45e175f25151fa3995e7a9')

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
