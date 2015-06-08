# Maintainer: Victor Dmitriyev <mrvvitek@gmail.com>
# Contributor: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: Simon Lipp <sloonz+aur@gmail.com>

pkgname=jogl2.2.4
_pkgname=jogl
pkgver=2.2.4
pkgrel=1
pkgdesc='OpenGL bindings for Java'
arch=('x86_64' 'i686')
url="http://jogamp.org/"
license=('BSD')
depends=('java-runtime' 'libgl'
         'libxcursor' 'libxxf86vm' 'libxrandr')
source=("jogl.license.txt"
        "gluegen.license.txt"
      	"http://jogamp.org/deployment/v${pkgver}/jar/orig/jogl-all.jar"
      	"http://jogamp.org/deployment/v${pkgver}/jar/orig/gluegen-rt.jar")
md5sums=('e77015f08f0c8c3b39b9b7d379d57183'
         '88456d8059e998bff8868c2b4d0347ce'
         '16b1f2b2deac092d28e1dc4968913b68'
         'fa393b581035892ed2e1c89e3303ad11')

source_i686=("http://jogamp.org/deployment/v${pkgver}/jar/orig/jogl-all-natives-linux-i586.jar"
	           "http://jogamp.org/deployment/v${pkgver}/jar/orig/gluegen-rt-natives-linux-i586.jar")
md5sums_i686=('b2c8fe318bdfb990a191e81a61bd1624'
              '27e694cd97fa54e8e4623b5e47eb7e17')

source_x86_64=("http://jogamp.org/deployment/v${pkgver}/jar/orig/jogl-all-natives-linux-amd64.jar"
	             "http://jogamp.org/deployment/v${pkgver}/jar/orig/gluegen-rt-natives-linux-amd64.jar")
md5sums_x86_64=('5ef1419e2253df87ecdb25f400afa33e'
                'a5bf47cf864d946cfcc47a3f4c8cab1e')

noextract=({jogl-all,gluegen-rt}.jar)
provides=("jogl=${pkgver}")
conflicts=('jogl')

package() {
  cd "${srcdir}"
  install -Dm644 "jogl-all.jar" "${pkgdir}/usr/share/java/${_pkgname}/jogl-all.jar"
  install -Dm644 "gluegen-rt.jar" "${pkgdir}/usr/share/java/${_pkgname}/gluegen-rt.jar"
  install -Dm644 "libgluegen-rt.so" "${pkgdir}/usr/lib/${_pkgname}/libgluegen-rt.so"
  install -Dm644 "libjogl_desktop.so" "${pkgdir}/usr/lib/${_pkgname}/libjogl_desktop.so"
  install -Dm644 "libjogl_mobile.so" "${pkgdir}/usr/lib/${_pkgname}/libjogl_mobile.so"
  install -Dm644 "libnativewindow_awt.so" "${pkgdir}/usr/lib/${_pkgname}/libnativewindow_awt.so"
  install -Dm644 "libnativewindow_x11.so" "${pkgdir}/usr/lib/${_pkgname}/libnativewindow_x11.so"
  install -Dm644 "libnewt.so" "${pkgdir}/usr/lib/${_pkgname}/libnewt.so"
  install -Dm644 "jogl.license.txt" "${pkgdir}/usr/share/licenses/${_pkgname}/jogl.license.txt"
  install -Dm644 "gluegen.license.txt" "${pkgdir}/usr/share/licenses/${_pkgname}/gluegen.license.txt"

  cd "${pkgdir}/usr/share/java/${_pkgname}"
  ln -s "jogl-all.jar" "jogl2.jar"
  ln -s "gluegen-rt.jar" "gluegen2-rt.jar"
  cd "${pkgdir}/usr/lib"
  ln -s "jogl" "jogl2"
  ln -s "jogl" "gluegen2"
  ln -s "libgluegen-rt.so" "jogl/libgluegen2-rt.so"
}

# vim:set ts=2 sw=2 et:
