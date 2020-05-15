# Maintainer: Jonathan Wright <jon@than.io>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Maxwell Pray a.k.a. Synthead <synthead@gmail.com>

_pkgname=jenkins-job-builder
pkgname=python-$_pkgname
pkgver=3.3.0
pkgrel=1
pkgdesc='Takes simple descriptions of Jenkins jobs in YAML or JSON format and uses them to configure Jenkins'
url='https://docs.openstack.org/infra/jenkins-job-builder/'
license=('APACHE')
arch=('any')
makedepends=('python-setuptools')
depends=(
  'python-six>=1.9.0'
  'python-yaml>=3.10.6'
  'python-yaml<6'
  'python-pbr>=1.8'
  'python-stevedore>=1.17.1'
  'python-python-jenkins>=0.4.15'
  'python-fasteners'
  'python-jinja>=2')
source=("https://files.pythonhosted.org/packages/f8/a4/8c1e0d5872ff2778a9f322653f3c88dd1acaf3f8629d5a6c012cf85e2d73/jenkins-job-builder-3.3.0.tar.gz")
sha512sums=('bb51f87bf118d519ef3ed5c3475a7c15827b686d02839c6e70d594b2262b9d4766b5b87530054cc9c2e3f11bb43dab754c9388b1d6cd3d79093a372a2823ee2b')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1
}
