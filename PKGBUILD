# Maintainer: Mohamar Rios <mohamar.rios@gmail.com>

pkgname=graphlab-create
pkgver=2.1
pkgrel=1
pkgdesc="Graphlab Create is an extensible machine learning framework."
arch=('x86_64')
url="https://turi.com"
license=('custom')
depends=('python2'
         'ipython2-notebook'
         'python2-boto'
         'python2-decorator'
         'python2-tornado'
         'python2-prettytable'
         'python2-requests'
         'python2-aws-cli'
         'python2-sseclient'
         'python2-multipledispatch'
         'python2-certifi'
         'python2-jsonschema'
         'python2-genson')
makedepends=('python2-setuptools')
options=(!emptydirs)
provides=("${pkgname}")
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('347d8649b8f368ccca258ac2e14687a3eb926abbe348eaa9180ca93594dc0eb1')

prepare() {
  echo "#########################################################"
	echo "#  Graphlab Create is only available to licensed users  #"
  echo "#       Students, researchers, and educators may        #"
  echo "#          obtain a free academic license for           #"
  echo "#         non-commercial use from the website           #"
	echo "#      Licenses may be installed with the package:      #"
  echo "#                graphlab-create-license                #"
  echo "#########################################################"
  echo
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python2 setup.py install --root="${pkgdir}/" --optimize=1

  install -Dm644 ${srcdir}/${pkgname}-${pkgver}/LICENSE.txt "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}

# vim: ft=sh syn=sh et
