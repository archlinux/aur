# Maintainer: Moacir R.F <moacirrf@gmail.com>
_basename="scenebuilder"
pkgname="javafx-scenebuilder"
_debpkg=SceneBuilder
pkgver="16.0.0"
_pkgver="16.0.0"
pkgrel=0
pkgdesc="Scene Builder is an open source tool that allows for drag and drop design of JavaFX user interfaces."
arch=('x86_64' 'i686')
url="https://gluonhq.com/products/scene-builder/"
license=('BSD License')
depends=('libarchive')
makedepends=()
optdepends=()
install=
source=(https://download2.gluonhq.com/scenebuilder/16.0.0/install/linux/$_debpkg"-"$_pkgver".deb")
sha1sums=('7a79ea806152808a6828b2ea01e86cf0b8ffecd6') 
build() {
  cd "$srcdir/"
  tar -xf data.tar.xz
echo "[Desktop Entry]
Name=Scene Builder 16.0.0
Comment=Gluon Scene Builder for Java 16
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

