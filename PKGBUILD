# Maintainer: Francois Menning <f.menning@protonmail.com>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: yugrotavele <yugrotavele at archlinux dot us>
# Contributor: Arkham <arkham at archlinux dot us>
# Contributor: Christoph Zeiler <archNOSPAM_at_moonblade.dot.org>
# Contributor: Arnaud Durand <biginozNOSPAM_at_free.dot.fr>
# Contributor: Nuno Araujo <nuno.araujo at russo79.com>

_pkgname=bleachbit
pkgname=bleachbit-git
pkgver=r5129.aedff9d9
pkgrel=1
pkgdesc='Deletes unneeded files to free disk space and maintain privacy.'
url='https://www.bleachbit.org/'
license=('GPL3')
source=("${_pkgname}::git+https://github.com/bleachbit/bleachbit.git")
sha256sums=('SKIP')
arch=('any')
depends=('python-gobject' 'gtk3')
optdepends=('cleanerml-git: Bonus cleaner pack')
makedepends=('git')
conflicts=('bleachbit')
provides=('bleachbit')

pkgver() {
  cd ${_pkgname}
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd ${_pkgname}
  make prefix=/usr DESTDIR="$pkgdir" install
}
