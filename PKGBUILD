# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: Francesco Minnocci <ascoli dot minnocci at gmail dot com>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>
# Contributor: SierraKiloBravo <aur at hillebrand dot io>

_pkgname=vieb
pkgname=${_pkgname}-bin
pkgver=12.6.0
pkgrel=1
pkgdesc="Vim Inspired Electron Browser - Vim bindings for the web by design"
arch=('x86_64')
url="https://${_pkgname}.dev"
license=('GPL-3.0')

conflicts=("${_pkgname}")
provides=("${_pkgname}")
depends=('gcc-libs' 'glibc' 'gtk3' 'glib2' 'libx11' 'libxext' 'libxkbcommon' 'libxcb' 'pango' 'libxcomposite' 'nss' 'expat' 'systemd-libs' 'alsa-lib' 'nspr' 'at-spi2-core' 'cairo' 'libxfixes' 'libxrandr' 'mesa' 'libxdamage' 'libcups' 'dbus' 'hicolor-icon-theme')

source=("https://github.com/Jelmerro/Vieb/releases/download/${pkgver}/${_pkgname}-${pkgver}.pacman")
sha512sums=('480d464a291bda8e311bda6c6abae564a97bfd1044009372b4146060ed0a450f42ea6f9642579c373eac73165a11f3007752746be41a8c943c6a6f7aef166d9b')

package() {
  cd "$srcdir"

  cp -R "${srcdir}/usr/" "${pkgdir}/usr/"
  cp -R "${srcdir}/opt/" "${pkgdir}/opt/"

  chmod 4755 "${pkgdir}/opt/Vieb/chrome-sandbox"

  # Create a symlink to the binary in /opt
  mkdir -p "${pkgdir}"/usr/bin
  ln -sf /opt/Vieb/vieb "${pkgdir}/usr/bin/${_pkgname}"
}
