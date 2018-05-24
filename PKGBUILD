# Maintainer: Mohamar Rios <mohamar.rios@gmail.com>

# Attention: These two values must be set manually.
registered_email=""
product_key=""


pkgname=graphlab-create-license
pkgver=2.1
pkgrel=1
pkgdesc="License installer for Graphlab Create"
arch=('x86_64')
url="https://turi.com"
license=('custom')
depends=('python2'
         'graphlab-create=2.1')
makedepends=('python2-setuptools')
options=(!emptydirs)
provides=("${pkgname}")
source=("https://get.graphlab.com/GraphLab-Create/2.1/${registered_email}/${product_key}/GraphLab-Create-License.tar.gz")
sha256sums=('SKIP')

prepare() {
  echo "#########################################################"
	echo "#  Graphlab Create is only available to licensed users  #"
  echo "#      Make sure to update the PKGBUILD with your       #"
  echo "#             Registered email address                  #"
  echo "#             Graphlab Create product key               #"
  echo "#      in order for the license installer to work       #"
  echo "#########################################################"
  echo
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python2 setup.py install --root="${pkgdir}/" --optimize=1
}
# vim: ft=sh syn=sh et
