# Maintainer: Josh Hoffer < hoffer.joshua@gmail.com > 
pkgname=awx
pkgver=3.0.1
pkgrel=1
pkgdesc="AWX provides a web-based user interface, REST API, and task engine built on top of Ansible."
arch=('any')
url="https://github.com/ansible/awx"
license=('Apache-2.0')
depends=('python2' 'gettext')
makedepends=('python2-setuptools')
options=(!emptydirs)
source=("https://github.com/ansible/${pkgname}/archive/${pkgver}.tar.gz")
md5sums=('a2f47ca91edf0178686a5de7fd4cc784')

build() {
  cd "$srcdir/${pkgname}-${pkgver}"
  python2 setup.py build
}

package() {
  cd "$srcdir/${pkgname}-${pkgver}"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
