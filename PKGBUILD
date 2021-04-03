# Maintainer: Pedro Veloso <pedro.n.veloso at gmail dot com>
# Maintainer: Andrius Semionovas <aneworld at gmail dot com>

pkgname=classyshark
pkgver=8.2
pkgrel=2
pkgdesc="Android executables browser. This is a standalone tool for Android developers."
arch=('any')
url="https://github.com/google/android-classyshark"
license=('Apache')
depends=('java-runtime')
source=("https://github.com/google/android-classyshark/releases/download/${pkgver}/ClassyShark.jar"
        'classyshark'
        'LICENSE.txt')
sha256sums=('b3bd94ce2177f2423183070c3dd096cb9b695a70e8e04d8d7d3cca530d9b855d'
            '730cbc8b3c97c482a15beacbc6a87a0fe46358a3d0158e2f6e08fc95116291a0'
            '58d1e17ffe5109a7ae296caafcadfdbe6a7d176f0bc4ab01e12a689b0499d8bd')
noextract=(ClassyShark.jar)

package() {
  # Install jar
  install -Dm644 ${srcdir}/ClassyShark.jar ${pkgdir}/usr/share/java/${pkgname}/classyshark.jar

  # Install license
  install -Dm644 ${srcdir}/LICENSE.txt ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt

  # Install run script
  install -Dm755 ${srcdir}/classyshark ${pkgdir}/usr/bin/classyshark
}
