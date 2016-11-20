# Maintainer: Michal Donát <michal at donat dot cz>
pkgname=gnome-shell-extension-no-topleft-hot-corner
_pkgname=nohotcorner
pkgver=14
_pkgver=${pkgver}.0
pkgrel=1
pkgdesc="Gnome shell extension disabling hotcorners"
arch=('any')
url="https://github.com/HROMANO/nohotcorner/"
license=('GPL2')
depends=('gnome-shell')
makedepends=('git')
install='gschemas.install'
source=("https://github.com/HROMANO/${_pkgname}/archive/v${_pkgver}.tar.gz")
md5sums=('2fc8061f21e121c7044ccc60f13eff3d')

package() {
  cd "${srcdir}/${_pkgname}-${_pkgver}"

  for i in $(find -type f); do
    install -Dm 644 "$i" "${pkgdir}/usr/share/gnome-shell/extensions/nohotcorner@azuri.free.fr/${i}"
  done
}
