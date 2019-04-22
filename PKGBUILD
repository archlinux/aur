# Maintainer : Kenneth Stier <kenny@trenta.io>

pkgname=rainier-ui-icons-git
pkgver=0.r426.f5ea2d3
pkgrel=1.2
pkgdesc='A crisp, modern icon theme for Trenta OS.'
arch=('any')
url='https://github.com/trenta-io/rainier-UI-icons/'
license=('GPL3')
depends=('bash' 'elementary-icon-theme-git')
makedepends=('git')
provides=('rainier-ui-icons')
conflicts=('rainier-ui-icons')
options=('!strip')
source=('rainier-ui-icons::git+https://github.com/trenta-io/rainier-UI-icons.git')
sha256sums=('SKIP')

pkgver() {
  cd rainier-ui-icons
  echo "0.r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

package() {
  cd rainier-ui-icons/usr/share/icons/
  install -dm 755 "${pkgdir}"/usr/share/icons
  cp -dr --no-preserve='ownership' Rainier "${pkgdir}"/usr/share/icons/
}
