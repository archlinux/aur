# Maintainer: Len Chan <lenchan139@tto.moe>
pkgname=brother-color-label-printer
pkgver=0.2
pkgbuild=3
pkgrel=3
pkgdesc="A Linux color labeling printing command tool for Brother VC-500W color label printer"
arch=('any')
url="https://m7i.org/projects/labelprinter-linux-python-for-vc-500w/"
license=('AGPLv3')
groups=('office')
depends=('python3')
makedepends=()
optdepends=()
provides=('labelprinter')
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(https://m7i.org/include/software/$provides-$pkgver.tar.xz)

noextract=()
md5sums=('2dad06a7c09e3bfbe0a99b0db5e1e77c')

build() {
	echo "Nothing to build"
}

package() {
  mkdir -p "${pkgdir}/opt/${pkgname}"
  mkdir -p "${pkgdir}/usr/bin"
  cp -ra "${srcdir}/${provides}" "${pkgdir}/opt/${pkgname}"
  touch  "${pkgdir}/opt/${pkgname}/labelprinter.sh"
 echo -en '#!/bin/sh \n PYTHONPATH=/opt/brother-color-label-printer/labelprinter python3 -m labelprinter "$@"' >  "${pkgdir}/opt/${pkgname}/labelprinter.sh"
 chmod a+rw "${pkgdir}/opt/${pkgname}/labelprinter.sh"
 chmod +x "${pkgdir}/opt/${pkgname}/labelprinter.sh"
  ln -s "/opt/${pkgname}/labelprinter.sh" "${pkgdir}/usr/bin/${pkgname}"
  ln -s "/opt/${pkgname}/labelprinter.sh" "${pkgdir}/usr/bin/bclprinter"
}
