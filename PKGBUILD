# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgbase=python-nose-cover3
pkgname=("python-nose-cover3" "python2-nose-cover3")
pkgver=0.1.0
pkgrel=4
pkgdesc="Coverage 3.x support for Nose"
arch=(any)
url="https://github.com/ask/nosecover3"
license=('LGPL')
options=('!emptydirs')
makedepends=('python-setuptools' 'python2-setuptools' 'git')
source=("git+https://github.com/ask/nosecover3.git#tag=v$pkgver")

prepare() {
  cp -r "nosecover3"{,-py2}
}

package_python-nose-cover3() {
  depends=('python-nose' 'python-coverage')

  cd nosecover3
  python setup.py install --root="${pkgdir}" --optimize=1
}

package_python2-nose-cover3() {
  depends=('python2-nose' 'python2-coverage')

  cd nosecover3-py2
  python2 setup.py install --root="${pkgdir}" --optimize=1
}

sha512sums=('SKIP')
