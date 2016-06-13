# Maintainer: Yan Burdonsky <psyrccio@gmail.com>
# Contributor: Christopher Arndt <aur -at- chrisarndt -dot- de>
_pkgname=ocenaudio
pkgname="$_pkgname-bin"
pkgver=3.1.1
pkgrel=3
pkgdesc="Cross-platform, easy to use, fast and functional audio editor"
arch=('i686' 'x86_64')
url="http://www.ocenaudio.com.br/"
license=('custom')
depends=('desktop-file-utils' 'gtk-update-icon-cache' 'jack' 'pulseaudio'
         'qt5-base' 'shared-mime-info')
provides=("$_pkgname")
conflicts=("$_pkgname")
install="$_pkgname.install"
source=("LICENSE.txt")
sha256sums=('SKIP')
sha256sums_i686=('2e94a7dd9c313523e027a25e8a7f26c232947c15ef351729b112f91dcfbd9722')
sha256sums_x86_64=('09b29a90a746e22559b4b28d61559c3df40066a4351a4935bdc3cbde2cdc9f8f')
source_i686=("http://www.ocenaudio.com.br/downloads/ocenaudio_debian32.deb")
source_x86_64=("http://www.ocenaudio.com.br/downloads/ocenaudio_debian64.deb")

build() {
  echo "ocenaudio 3.1.1"
}

package() {
  tar -xJf ${srcdir}/data.tar.xz -C "${pkgdir}"

  install -dm755 "${pkgdir}/usr/bin"
  ln -sf "/opt/$_pkgname/bin/${_pkgname}" "${pkgdir}/usr/bin"
  install -Dm644 "${srcdir}/LICENSE.txt" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
  rm -rf "${pkgdir}/var"
}
