# Maintainer : Kenneth Stier <kenny@trenta.io>

pkgname=trenta-icons
pkgver=0.r448.c217cf9
pkgrel=1
pkgdesc='A crisp, modern icon theme for Trenta OS.'
arch=('any')
url='https://github.com/trenta-io/trenta-icons'
license=('GPL3')
depends=('bash')
makedepends=('git')
provides=('trenta-icons')
conflicts=('trenta-icons')
replaces=('rainier-ui-icons-git')
options=('!strip')
source=('trenta-icons::git+https://github.com/trenta-io/trenta-icons.git')
sha256sums=('SKIP')

pkgver() {
  cd trenta-icons
  echo "0.r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

package() {
  cd trenta-icons/usr/share/icons/
  install -dm 755 "${pkgdir}"/usr/share/icons
  cp -dr --no-preserve='ownership' Trenta "${pkgdir}"/usr/share/icons/
}
