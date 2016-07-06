# Maintainer: Michael Straube <michael_straube web de>

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
sha1sums=('6eb906af88163fcc6675a1b7304d05f2f689a869'
          'c61a4890127702f17411ba2adef0bec8ad1fd18f')

package() {
  cd "CubeTwister $pkgver"

  install -d -m 755 "$pkgdir"/usr/share/{java/cubetwister,doc/cubetwister/guide}

  install -m 644 CubeTwister.jar *.jnilib "$pkgdir/usr/share/java/cubetwister/"
  install -m 644 cubetwister-guide.html "$pkgdir/usr/share/doc/cubetwister/"
  install -m 644 guide/* "$pkgdir/usr/share/doc/cubetwister/guide/"

  install -D -m 755 "$srcdir/cubetwister" "$pkgdir/usr/bin/cubetwister"
}
