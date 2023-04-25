# Maintainer: Nicolas Stalder <n+archlinux@stalder.io>
pkgname=padloc-bin
pkgver=4.3.0
pkgrel=1
pkgdesc="A modern, open source password manager for individuals and teams."
url="https://padloc.app/"
_githuburl="https://github.com/padloc/padloc"
arch=(x86_64)
license=('AGPL3')
depends=('webkit2gtk' 'openssl' 'cairo' 'gcc-libs' 'gdk-pixbuf2' 'glibc' 'glib2' 'gtk3' 'hicolor-icon-theme')
optdepends=()
provides=()
conflicts=("${pkgname%-bin}")
options=(!strip)
source=("${pkgname%-bin}-${pkgver}.deb::${_githuburl}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_amd64.deb")
sha256sums=('d5bec5b1467cd98349e00d1c7a54a32703c31d9e69da553541ad13b3cdc45f60')

package() {
  bsdtar -xf "${srcdir}/data.tar.gz" -C "${pkgdir}" --gname root --uname root
}