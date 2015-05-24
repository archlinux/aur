# Maintainer: Victor Dmitriyev <mrvvitek@gmail.com>
# Contributor: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: Simon Lipp <sloonz+aur@gmail.com>

pkgname=jogl
pkgver=2.3.1
pkgrel=2
pkgdesc='OpenGL bindings for Java'
arch=('x86_64' 'i686')
url="http://jogamp.org/"
license=('BSD')
depends=('java-runtime' 'libgl')
source=("jogl.license.txt"
  "gluegen.license.txt"
	"http://jogamp.org/deployment/v${pkgver}/jar/orig/jogl-all.jar"
	"http://jogamp.org/deployment/v${pkgver}/jar/orig/gluegen-rt.jar")
md5sums=('e77015f08f0c8c3b39b9b7d379d57183'
  '88456d8059e998bff8868c2b4d0347ce'
  '888f852769e4a2deb908d0c3785d7a78'
  '3a87d58820bafc2f164c33d8f4d609ad')

source_i686=("http://jogamp.org/deployment/v${pkgver}/jar/orig/jogl-all-natives-linux-i586.jar"
	"http://jogamp.org/deployment/v${pkgver}/jar/orig/gluegen-rt-natives-linux-i586.jar")
md5sums_i686=('1a43558d33b08d7195a19813f42c8610'
  '78dbf2cc29f7c03d58309d73eb4b6851')

source_x86_64=("http://jogamp.org/deployment/v${pkgver}/jar/orig/jogl-all-natives-linux-amd64.jar"
	"http://jogamp.org/deployment/v${pkgver}/jar/orig/gluegen-rt-natives-linux-amd64.jar")
md5sums_x86_64=('aba089cd88733cd45a1c16ea672835f7'
  'fcdc21b6d65c08ef79351cbc8aaefdb9')

noextract=({jogl-all,gluegen-rt}.jar)

package() {
  cd "${srcdir}"
  install -Dm644 "jogl-all.jar" "${pkgdir}/usr/share/java/${pkgname}/jogl-all.jar"
  install -Dm644 "gluegen-rt.jar" "${pkgdir}/usr/share/java/${pkgname}/gluegen-rt.jar"
  install -Dm644 "libgluegen-rt.so" "${pkgdir}/usr/lib/${pkgname}/libgluegen-rt.so"
  install -Dm644 "libjogl_desktop.so" "${pkgdir}/usr/lib/${pkgname}/libjogl_desktop.so"
  install -Dm644 "libjogl_mobile.so" "${pkgdir}/usr/lib/${pkgname}/libjogl_mobile.so"
  install -Dm644 "libnativewindow_awt.so" "${pkgdir}/usr/lib/${pkgname}/libnativewindow_awt.so"
  install -Dm644 "libnativewindow_x11.so" "${pkgdir}/usr/lib/${pkgname}/libnativewindow_x11.so"
  install -Dm644 "libnewt.so" "${pkgdir}/usr/lib/${pkgname}/libnewt.so"
  install -Dm644 "jogl.license.txt" "${pkgdir}/usr/share/licenses/${pkgname}/jogl.license.txt"
  install -Dm644 "gluegen.license.txt" "${pkgdir}/usr/share/licenses/${pkgname}/gluegen.license.txt"

  cd "${pkgdir}/usr/share/java/${pkgname}"
  ln -s "jogl-all.jar" "jogl2.jar"
  ln -s "gluegen-rt.jar" "gluegen2-rt.jar"
  cd "${pkgdir}/usr/lib"
  ln -s "jogl" "jogl2"
  ln -s "jogl" "gluegen2"
  ln -s "libgluegen-rt.so" "jogl/libgluegen2-rt.so"
}

# vim:set ts=2 sw=2 et:
