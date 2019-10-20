# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Maxwell Pray a.k.a. Synthead <synthead@gmail.com>
# Contributor: Jonathan Wright <jon@than.io>

_pkgname=jenkins-job-builder
pkgname=python-$_pkgname
pkgver=3.0.2
pkgrel=1
pkgdesc='Takes simple descriptions of Jenkins jobs in YAML or JSON format and uses them to configure Jenkins'
url='https://docs.openstack.org/infra/jenkins-job-builder/'
license=('APACHE')
arch=('any')
makedepends=('python-setuptools')
depends=(
  'python-six'
  'python-yaml'
  'python-pbr'
  'python-stevedore'
  'python-python-jenkins'
  'python-fasteners'
  'python-jinja')
source=("https://files.pythonhosted.org/packages/2e/fb/b78fa65fe61e8d7b92864fa1b760f0451ba88fcebc899be85a41ca758019/${_pkgname}-${pkgver}.tar.gz")
sha512sums=('1110fa2fea327ae0a9ed346de2fab61b6623f9f2743996e599025a68e3b8294eef024c4d6dd300b1d6d37f7f98a5d763b8ae478cc3bedbc2e1a04359a0ba7254')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1
}
