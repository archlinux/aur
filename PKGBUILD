# Maintainer: Jose Riha <jose1711 gmail com>

pkgname=nmonvisualizer
pkgver=2016_02_29
_jarname=NMONVisualizer_${pkgver//_/-}.jar
pkgrel=1
pkgdesc="Java GUI tool for analyzing nmon system files from both AIX and Linux"
arch=('any')
url="https://nmonvisualizer.github.io/nmonvisualizer/"
license=('GPL')
depends=('java-runtime')
source=('http://dl.bintray.com/nmonvisualizer/NMONVisualizer/NMONVisualizer_2016-02-29.jar'
        'nmonvisualizer.desktop')
noextract=(${_jarname})

package() {
  cd "${srcdir}"

  install -Dm644 ${_jarname} "${pkgdir}"/usr/share/java/$pkgname/nmonvisualizer.jar
  install -Dm644 "${srcdir}"/${pkgname}.desktop ${pkgdir}/usr/share/applications/$pkgname.desktop

#executable file
  install -d "${pkgdir}"/usr/bin
  cat <<"EOF" >"${pkgdir}"/usr/bin/nmonvisualizer
#!/bin/sh
java -jar /usr/share/java/nmonvisualizer/nmonvisualizer.jar
EOF
  chmod 755 "${pkgdir}"/usr/bin/$pkgname
}
md5sums=('232477f6733298f953276fa447e173f3'
         '5d73f2bfea723aa172e688b0b2d1dae8')
