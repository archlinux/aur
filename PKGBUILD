# Maintainer: Hakim Zulkufli <hakim dot zulkufli at gmail dot com>

pkgname=luna-icon-theme-git
pkgver=1.7.r0.g0e93e0e9
pkgrel=1
pkgdesc='Icon pack based on marwaita and papirus icons.'
arch=('any')
url='https://github.com/darkomarko42/Luna-Icons'
license=('GPLv3')
provides=("${pkgname%-*}" "${pkgname}")
conflicts=("${pkgname%-*}" "${pkgname}")
options=('!strip')
makedepends=('git')
source=("luna-icon-theme::git+${url}")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/luna-icon-theme"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "${srcdir}/luna-icon-theme/Luna"
  install -dm755 "${pkgdir}/usr/share/icons/Luna"
  cp -drf --no-preserve='ownership' * "${pkgdir}/usr/share/icons/Luna"

  cd "$srcdir/luna-icon-theme/Luna-Light"
  install -dm755 "${pkgdir}/usr/share/icons/Luna-Light"
  cp -drf --no-preserve='ownership' * "${pkgdir}/usr/share/icons/Luna-Light"

  cd "${srcdir}/luna-icon-theme/Luna-Dark"
  install -dm755 "${pkgdir}/usr/share/icons/Luna-Dark"
  cp -drf --no-preserve='ownership' * "${pkgdir}/usr/share/icons/Luna-Dark"

  cd "${srcdir}/luna-icon-theme/Luna icons OSX"
  install -dm755 "${pkgdir}/usr/share/icons/Luna icons OSX"
  cp -drf --no-preserve='ownership' * "${pkgdir}/usr/share/icons/Luna icons OSX"

  cd "${srcdir}/luna-icon-theme/Luna icons OSX Light"
  install -dm755 "${pkgdir}/usr/share/icons/Luna icons OSX Light"
  cp -drf --no-preserve='ownership' * "${pkgdir}/usr/share/icons/Luna icons OSX Light"

  cd "${srcdir}/luna-icon-theme/Luna icons OSX Dark"
  install -dm755 "${pkgdir}/usr/share/icons/Luna icons OSX Dark"
  cp -drf --no-preserve='ownership' * "${pkgdir}/usr/share/icons/Luna icons OSX Dark"
}
