pkgname="readium-desktop"
pkgver="1.0.0_alpha.2"
_pkgver="1.0.0-alpha.2"
pkgrel=1
pkgdesc="Desktop application to read ebooks"
arch=('x86_64')
url="https://github.com/edrlab/readium-desktop"
license=('BSD-3-Clause')
depends=('gconf' 'libnotify' 'libappindicator-gtk2' 'libxtst' 'libnss_nis' 'libxss')
source=("https://github.com/readium/readium-desktop/releases/download/v${_pkgver}/readium-desktop_${_pkgver}_amd64.deb")
sha256sums=('406d19ba8d2e42e4683b79b4548bec016cae844470e0482b2752d5203c8cca51')

package() {
  cd "$srcdir"
  tar -xf data.tar.xz -C "$pkgdir"
  mkdir -p "${pkgdir}"/usr/bin
  ln -sf '/opt/ReadiumDesktop/readium-desktop' "${pkgdir}"/usr/bin/readium-desktop
}
