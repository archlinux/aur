# Maintainer: Florian Jacob <projects+arch AT florianjacob )DOT( de>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=python-fritzconnection-git
pkgver=r40.8171434b964b
pkgrel=2
pkgdesc='Python-Tool to communicate with the AVM FritzBox. Uses the TR-064 protocol.'
license=('MIT')
arch=('any')
url='https://bitbucket.org/kbr/fritzconnection'
depends=(
  'python-lxml'
  'python-requests'
  )
makedepends=('python-setuptools')
source=("hg+https://bitbucket.org/kbr/fritzconnection")
sha512sums=('SKIP')

pkgver() {
  cd fritzconnection
  printf "r%s.%s" "$(hg identify -n)" "$(hg identify -i)"
}

package() {
  cd fritzconnection
  python setup.py install --root="$pkgdir"
}
