# Maintainer: Aube kcep1hr08@mozmail.com

pkgname="dalvikus-bin"
_pkgname="dalvikus"
pkgver=1.0.13
pkgrel=1
pkgdesc="Android reverse-engineering tool / smali editor"
arch=("x86_64")
url="https://github.com/loerting/dalvikus"
license=('GPL-3.0-only')

provides=("${_pkgname}")
conflicts=("${_pkgname}")

source=("https://github.com/loerting/${_pkgname}/releases/download/v${pkgver}/${_pkgname}_${pkgver}-1_amd64.deb")

sha256sums=('4853ae6d1cd61f3caa0e07a4aeadc070c33f36d6269a95f59b2409df739b7a1d')

package() {
  tar -xf "$srcdir"/data.tar.* -C "${pkgdir}"

  mkdir -p "${pkgdir}/usr/bin"
  ln -s "/opt/${_pkgname}/bin/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
}
