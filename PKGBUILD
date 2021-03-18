# Maintainer: Jonathan Wright <jon@than.io>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Maxwell Pray a.k.a. Synthead <synthead@gmail.com>

_pkgname=jenkins-job-builder
pkgname=python-$_pkgname
pkgver=3.9.0
pkgrel=1
pkgdesc='Takes simple descriptions of Jenkins jobs in YAML or JSON format and uses them to configure Jenkins'
url='https://docs.openstack.org/infra/jenkins-job-builder/'
license=('APACHE')
arch=('any')
makedepends=('python-setuptools')
depends=(
  'python-six>=1.9.0'
  'python-yaml>=3.10.0'
  'python-yaml<6'
  'python-pbr>=1.8'
  'python-stevedore>=1.17.1'
  'python-python-jenkins>=0.4.15'
  'python-fasteners'
  'python-jinja>=2')
source=('https://files.pythonhosted.org/packages/1b/63/a87bc9bd2461cb0fbc59b257df94c579bcdcec17dac070f04d4a0e57214c/jenkins-job-builder-3.9.0.tar.gz')
sha256sums=('4a53e146843d567c375c2e61e70a840d75a412402fd78c1dd3da5642a6aaa375')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1
}
