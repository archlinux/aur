# Maintainer: timescam <timescam at duck dot com>

_pkgname=via
pkgname=$_pkgname-bin
pkgver=2.2.0
pkgrel=0
pkgdesc="an electron wrapper that points to https://usevia.app/"
arch=(any)
url="https://caniuse$_pkgname.com/"
provides=("${_pkgname}=${pkgver}")
depends=("gtk3" 
        "libnotify"
        "nss"
        "libxss"
        "libxtst"
        "xdg-utils" 
        "at-spi2-core"
        "libutil-linux"
        "libsecret")
optdepends=("libappindicator-gtk3: recommended for app indicator")
_filename=("${_pkgname}-${pkgver}-linux.deb")
source=("https://github.com/the-$_pkgname/releases/releases/download/v${pkgver}/$_filename")

md5sums=("6df4d5acede5e0e57aacd4f17c83bb19")

build() {
  mkdir -p "${srcdir}/output"
  tar -xvf "${srcdir}/data.tar.xz" -C "${srcdir}/output"
}

package() {
  cp -r "${srcdir}/output/"* "${pkgdir}"
  install -d "${pkgdir}"/usr/bin
  ln -s /opt/VIA/via-nativia "${pkgdir}"/usr/bin/via
}
