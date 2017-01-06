# Maintainer: twa022 <twa022 at gmail dot com>

_basename=xfce4-weather-mono-icons
pkgname=${_basename}-git
pkgver=0.r8.558c0a8
pkgrel=1
pkgdesc='mono-dark and mono-light icons for xfce4-weather-plugin'
arch=('any')
url="https://github.com/kevlar1818/${_basename}"
license=('GPLv2')
depends=('xfce4-weather-plugin')
makedepends=('git')
options=('!strip')
source=("git+https://github.com/kevlar1818/${_basename}.git")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_basename}"
  echo "0.r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

package() {
  mkdir -p "${pkgdir}/usr/share/xfce4/weather/icons"
  cp -dr --no-preserve='ownership' "${srcdir}/${_basename}/"{WSky,WSky-Light} "${pkgdir}/usr/share/xfce4/weather/icons"
}
