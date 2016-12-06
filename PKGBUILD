# Maintainer: Michael Straube <straubem@gmx.de>

pkgname=cubetwister
pkgver=2.0.155
pkgrel=2
pkgdesc="Your companion to your Rubik's Cube, a highly configurable editor for cube scripts"
arch=('any')
license=('CCPL:by-3.0')
url="https://www.randelshofer.ch/cubetwister"
depends=('bash' 'java-runtime')
source=("https://www.randelshofer.ch/cubetwister/files/$pkgname-$pkgver.zip"
        "cubetwister")
sha256sums=('b471c797ea77fda6936c0ec4c5f50338171dc7f5436be732d74b677288d49d84'
            'dad28b8f8fbae86ba88707492135c302bb6616ab817f49894d3da58498016889')

package() {
  cd "CubeTwister $pkgver"

  install -d "$pkgdir"/usr/share/{java/cubetwister,doc/cubetwister/guide}

  install -m 644 CubeTwister.jar *.jnilib "$pkgdir"/usr/share/java/cubetwister
  install -m 644 cubetwister-guide.html "$pkgdir"/usr/share/doc/cubetwister
  install -m 644 guide/* "$pkgdir"/usr/share/doc/cubetwister/guide

  install -D -m 755 ../cubetwister "$pkgdir"/usr/bin/cubetwister
}
