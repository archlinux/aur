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
pkgver=r4154.0d437691
pkgrel=1
pkgdesc='Deletes unneeded files to free disk space and maintain privacy.'
url='https://www.bleachbit.org/'
license=('GPL3')
source=('git://github.com/bleachbit/bleachbit.git')
sha256sums=('SKIP')
arch=('any')
depends=('pygtk')
optdepends=('cleanerml-git: Bonus cleaner pack')
makedepends=('git')
conflicts=('bleachbit')
provides=('bleachbit')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd ${srcdir}/${_pkgname}
  make prefix=/usr DESTDIR="$pkgdir" PYTHON=python2 install
}
