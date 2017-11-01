#Maintainer: "Yannick LM <yannicklm1337 AT gmail DOT com>"

pkgname=pycp
pkgver="8.0.4"
pkgrel=1
pkgdesc="cp and mv with a progressbar"
url="http://github.com/dmerejkowsky/pycp"
arch=('any')
license=('MIT')
depends=('python' 'python-cli-ui' 'python-attrs')
makedepends=('python' 'python-setuptools')
source=('https://files.pythonhosted.org/packages/44/12/f1ac9c9386307f3f24b6dbb184e99c5333416d34f28f5633c59061c8dd2e/pycp-8.0.4.tar.gz')
checkdepends=('python-pytest' 'python-pytest-mock')

md5sums=('bd7872adaccb712aae39cba77451c594')


build() {
  cd ${srcdir}/pycp-${pkgver}
  python setup.py build
}

check() {
  cd ${srcdir}/pycp-${pkgver}
  PYTHONPATH=. pytest
}

package() {
  cd ${srcdir}/pycp-${pkgver}
  python setup.py install --root=$pkgdir/ --optimize=1

  # license
  mkdir -p $pkgdir/usr/share/licenses/pycp
  install COPYING.txt $pkgdir/usr/share/licenses/pycp/COPYING
}

# vim:set ts=2 sw=2 et:
