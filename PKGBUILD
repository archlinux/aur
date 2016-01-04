# Maintainer: Philipp Joram <phijor AT t-online DOT de>
# Contributor: Mohammed Yaseen Mowzer <moyamodehacker@gmail.com>
# Contributor: Hugo Osvaldo Barrera <hugo@barrera.io>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname='python-yowsup-git'
pkgver=2.4.48.r0.ga59ac41
pkgrel=1
pkgdesc="The open source cross platform Whatsapp library powering Wazapp"
url="https://github.com/tgalal/yowsup"
arch=('any')
license=('GPL')
depends=('python' 'python-dateutil' 'python-argparse' 'python-axolotl-git' 'python-pillow')
makedepends=('python-setuptools')
conflicts=('yowsup-client-git')
source=("${pkgname}::git+https://github.com/tgalal/yowsup")
sha512sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}"
  git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "${srcdir}/${pkgname}"
  python setup.py install --root="$pkgdir/"
}

# vim:set ts=2 sw=2 et:
