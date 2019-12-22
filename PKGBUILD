# Maintainer: Jonathan Wright <jon@than.io>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Maxwell Pray a.k.a. Synthead <synthead@gmail.com>

_pkgname=jenkins-job-builder
pkgname=python-$_pkgname
pkgver=3.1.0
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
source=("https://files.pythonhosted.org/packages/ca/d6/9679236fac38219ed4124b566ac20856c34c41cb1e0b8b2269650c18809d/jenkins-job-builder-3.1.0.tar.gz")
sha512sums=('db7b0ba999cda5b94b11ef67daa5e2a971062ffdbd2e6bd693a4a243d144bc6fa6f64a9b6cd3f78cc058ea988fb9e33b1379d6cd77ba64ef2c6c3053bf03e58f')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1
}
