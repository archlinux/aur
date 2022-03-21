# Maintainer: Drommer <drommer@github.com>

_pkgname=org.kde.plasma.translator
pkgname=plasma5-applets-translator
pkgver=0.8
pkgrel=1
pkgdesc="Easy to use translation plasmoid (GUI for translate-shell package)"
url="https://store.kde.org/p/1395666"
arch=('any')
license=('MIT')
depends=('plasma-workspace' 'translate-shell')
source=("${_pkgname}.tar.gz")
sha256sums=('5fee9560a2306bbd56c0b3b4430efebc03c0f159885e2461474fa938100eb3a6')

package() {
  cd "${srcdir}/${_pkgname}"
  install -dm755 "${pkgdir}/usr/share/plasma/plasmoids/${_pkgname}"
  install -Dm644 metadata.desktop -t "${pkgdir}/usr/share/plasma/plasmoids/${_pkgname}"
  find contents/ -type f -exec install -Dm644 "{}" "${pkgdir}/usr/share/plasma/plasmoids/${_pkgname}/{}" \;
}
