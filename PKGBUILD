# Maintainer: Ricardo Rodríguez Schmidt <ricrogz at gmail.com>

pkgname='pymol2'
_pkgname='pymol2'
pkgver='2.0.7'
pkgrel='1'
pkgdesc='Molecular visualization system on an Open Source foundation with PyQt interface'
arch=('x86_64')
options=(!strip)
url='https://pymol.org/2/'
license=('Commercial')
depends=('')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("https://pymol.org/installers/PyMOL-${pkgver}_0-Linux-${arch}.tar.bz2")
sha1sums=('967495b4810f7bf72f914e0f1a3648a4614f258d')
sha256sums=('c7fb43f512882f250d006d0cb6eda70951d75671c411ca0fd665321820316bd4')
noextract=("PyMOL-${pkgver}_0-Linux-${arch}.tar.bz2")
build() {
  mkdir -p "${srcdir}/opt/${pkgname}"
  bsdtar --strip-components 1 -jxf PyMOL-${pkgver}_0-Linux-${arch}.tar.bz2 \
      -C "${srcdir}/opt/${pkgname}"
}
package() {
  mkdir -p "${pkgdir}/usr/bin/"

  rsync -rtl "${srcdir}/opt" "${pkgdir}"

  ln -s "/opt/${pkgname}/bin/pymol" \
            "${pkgdir}/usr/bin/${pkgname}"
}
