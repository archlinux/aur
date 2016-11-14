# Maintainer: Pedro Veloso <pedro.n.veloso at gmail dot com>

pkgname=classyshark
pkgver=7.1
pkgrel=2
pkgdesc="Android executables browser. This is a standalone tool for Android developers."
arch=('any')
url="https://github.com/google/android-classyshark"
license=('Apache')
depends=('java-environment')
source=("https://github.com/google/android-classyshark/releases/download/${pkgver}/ClassyShark.jar"
        'classyshark'
        'LICENSE.txt')
sha256sums=('dfc99880a13450aa5bedb1b26e136f7d5cd2089c2dee4509363ef9e8cc427d52'
            '4c900ed2e490735e7b59bbe1850c3e77572c5803de5dba74ce249914e8374b97'
            '58d1e17ffe5109a7ae296caafcadfdbe6a7d176f0bc4ab01e12a689b0499d8bd')
noextract=(ClassyShark.jar)

package() {
  # Install jar
  install -Dm644 ${srcdir}/ClassyShark.jar ${pkgdir}/usr/share/${pkgname}/classyshark.jar

  # Install license
  install -Dm644 ${srcdir}/LICENSE.txt ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt

  # Install run script
  install -Dm755 ${srcdir}/classyshark ${pkgdir}/usr/bin/classyshark
}
