# Maintainer: Michael Straube <m.s.online gmx.de>

pkgname=cubetwister
pkgver=2.0.155
pkgrel=1
pkgdesc="Your companion to your Rubik's Cube, a highly configurable editor for cube scripts"
arch=('any')
license=('CCPL:by-3.0')
url="https://www.randelshofer.ch/cubetwister"
depends=('bash' 'java-runtime')
source=("https://www.randelshofer.ch/cubetwister/files/$pkgname-$pkgver.zip")
sha1sums=('6eb906af88163fcc6675a1b7304d05f2f689a869')

prepare() {
  printf '#!/bin/bash\njava -jar /usr/share/cubetwister/CubeTwister.jar "$@"' > cubetwister
}

package() {
  cd "CubeTwister $pkgver"

  install -dm755 "$pkgdir/usr/share/cubetwister"
  cp -r * "$pkgdir/usr/share/cubetwister/"

  install -Dm755 "$srcdir/cubetwister" "$pkgdir/usr/bin/cubetwister"
}
