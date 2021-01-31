# Maintainer: Moacir R.F <moacirrf@gmail.com>
_basename="scenebuilder"
pkgname="javafx-scenebuilder"
_debpkg=SceneBuilder
pkgver="15.0.1"
_pkgver="15.0.1"
pkgrel=1
pkgdesc="Scene Builder is an open source tool that allows for drag and drop design of JavaFX user interfaces."
arch=('x86_64' 'i686')
url="https://gluonhq.com/products/scene-builder/"
license=('BSD License')
depends=('libarchive')
makedepends=()
optdepends=()
install=
source=(https://download2.gluonhq.com/scenebuilder/15.0.1/install/linux/$_debpkg"-"$_pkgver".deb")
sha1sums=('05b1d34896e9eb4dd10edbc4160ed50697da29c3') 
build() {
  cd "$srcdir/"
  tar -xf data.tar.xz
echo "[Desktop Entry]
Name=Scene Builder 15.0.1
Comment=Gluon Scene Builder for Java 15.0.0
Exec=/opt/${_basename}/bin/SceneBuilder
Icon=/opt/${_basename}/lib/SceneBuilder.png
Terminal=false
Type=Application
Categories=Development;GTK;">"${srcdir}/opt/${_basename}/lib/${_basename}.desktop"
}

package() {
  cp -rf "$srcdir/opt" "$pkgdir"
  install -d "${pkgdir}/usr/share/applications/"
  install -d "${pkgdir}/usr/share/pixmaps/"
  install -d "${pkgdir}/usr/bin/"
  ln -s "/opt/${_basename}/bin/SceneBuilder" "${pkgdir}/usr/bin/${pkgname}"
  install -m644 "${srcdir}/opt/${_basename}/lib/${_basename}.desktop" "${pkgdir}/usr/share/applications/"
  install -m644 "${srcdir}/opt/${_basename}/lib/SceneBuilder.png" "${pkgdir}/usr/share/pixmaps/"
}

