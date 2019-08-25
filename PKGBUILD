# Maintainer: jerry73204 <jerry73204@gmail.com>
pkgname=vtk-docs
pkgver=8.2.0
pkgrel=1
pkgdesc="Documentation for VTK"
arch=('any')
url="https://vtk.org/"
license=('BSD')
options=('!strip')
depends=()
makedepends=('libarchive')
source=("https://www.vtk.org/files/release/${pkgver%.*}/vtkDocHtml-${pkgver}.tar.gz")
sha256sums=('a41a40fad204aff45e257e62fa7d25eb4b9f10f1f7acc4b3b0e9f06165c987d3')
noextract=("vtkDocHtml-${pkgver}.tar.gz")

package() {
  cd "${srcdir}"
  install -dv "${pkgdir}/usr/share/doc/vtk"
  bsdtar -xf "vtkDocHtml-${pkgver}.tar.gz" -C "${pkgdir}/usr/share/doc/vtk"
}
