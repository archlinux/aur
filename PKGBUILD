# Maintainer: Jan Holthuis <holthuis.jan@googlemail.com>

pkgname=sabnzbd-knockstrap-git
pkgver=20140816
pkgrel=1
pkgdesc="Knockstrap is a theme for SABnzbd, the popular automated Usenet download tool. It brings a larger, more modern, brighter and cleaner look to one of your favorite tools."
arch=('any')
url="https://github.com/aforty/sabnzbd-knockstrap"
license=('GPL')
depends=('sabnzbd')
makedepends=('git')
conflicts=('sabnzbd-knockstrap')
provides=('sabnzbd-knockstrap')
source=('git+https://github.com/aforty/sabnzbd-knockstrap.git')
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/sabnzbd-knockstrap"
  git describe --tags --long | sed -E 's/([^-]+-g)/r\1/;s/-/./g;s/^v//g'
}

package() {
  mkdir -p "${pkgdir}/opt/sabnzbd/interfaces/"
  cp -dr --no-preserve=ownership "${srcdir}/sabnzbd-knockstrap/Knockstrap" "${pkgdir}/opt/sabnzbd/interfaces/${pkgname}/" || return 1
}
