# Maintainer: timescam <rex.ky.ng at gmail dot com>

_pkgname=via
pkgname=$_pkgname-bin
pkgver=1.2.7
pkgrel=0
pkgdesc="Yet another keyboard configurator, compatible with over over 40 keyboards and easily added to other QMK keyboards."
arch=(any)
url="https://caniuse$_pkgname.com/"
provides=("${_pkgname}=${pkgver}")
depends=("hicolor-icon-theme"
        "gtk3" 
        "libnotify"
        "nss"
        "libxss"
        "libxtst"
        "xdg-utils" 
        "at-spi2-core"
        "libutil-linux"
        "libappindicator-gtk3"
        "libsecret")
_filename=("${_pkgname}-${pkgver}-linux.deb")
source=("https://github.com/the-$_pkgname/releases/releases/download/v${pkgver}/$_filename"
        via)

md5sums=("7e731f53fac0b0dbeb9fc11dbfcd1a07"
        "dc41d6a454c010ff44c2f22678dbd79e")

build() {
  mkdir -p "${srcdir}/output"
  tar -xvf "${srcdir}/data.tar.xz" -C "${srcdir}/output"
}

package() {
  cp -r "${srcdir}/output/"* "${pkgdir}"
  install -d "${pkgdir}"/usr/bin
}
