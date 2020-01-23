# Maintainer: timescam <rex.ky.ng at gmail dot com>

_pkgname=via
pkgname=$_pkgname-bin
pkgver=1.2.4
pkgrel=1
pkgdesc="VIA Configurator, compatible with over over 40 keyboards and easily added to other QMK keyboards."
arch=(any)
url="https://caniuse$_pkgname.com/"
provides=("${_pkgname}=${pkgver}")
depends=("hicolor-icon-theme")
_filename=("${_pkgname}-${pkgver}-linux.deb")
source=("https://github.com/the-$_pkgname/releases/releases/download/v${pkgver}/$_filename"
        via)

md5sums=("727000af3573ffaad3d5791c791de42e"
        "dc41d6a454c010ff44c2f22678dbd79e")

build() {
  mkdir -p "${srcdir}/output"
  tar -xvf "${srcdir}/data.tar.xz" -C "${srcdir}/output"
}

package() {
  cp -r "${srcdir}/output/"* "${pkgdir}"
  install -d "${pkgdir}"/usr/bin
}