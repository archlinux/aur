# Maintainer: Solomon Choina <shlomochoina@gmail.com>
pkgname=kawanime
pkgver=0.2.1
pkgrel=1
pkgdesc="Desktop app for anime fans"
arch=('x86_64')
url="https://github.com/Kylart/KawAnime"
license=('MIT')
depends=('nodejs')
#dpkg is not actually needed, it's just to avoid a build failure
source=("https://github.com/Kylart/$pkgname/releases/download/v${pkgver}/${pkgname}_${pkgver}_amd64.deb")
sha256sums=('79d572a261547f35859aca0622b9ecfa982d25b53123659d12b0fe124e037b9f')

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
