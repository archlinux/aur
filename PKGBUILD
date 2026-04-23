# Maintainer: Vadim Yanitskiy <fixeria@osmocom.org>
# Contributor: Jonathan Wright <jon@than.io>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Maxwell Pray a.k.a. Synthead <synthead@gmail.com>

_pkgname=jenkins_job_builder
pkgname="python-jenkins-job-builder"
pkgver=6.4.4
pkgrel=1
pkgdesc='Takes simple descriptions of Jenkins jobs in YAML or JSON format and uses them to configure Jenkins'
url='https://jenkins-job-builder.readthedocs.io/en/latest/'
license=('Apache-2.0')
arch=('any')
makedepends=('python-setuptools')
depends=(
  'python-six>=1.9.0'
  'python-yaml>=3.13'
  'python-pbr>=1.8'
  'python-stevedore>=1.17.1'
  'python-python-jenkins>=1.8.2'
  'python-fasteners'
  'python-jinja>=2')
source=("https://files.pythonhosted.org/packages/bc/1d/66a4e12c3e93716130bc6a8eba717216e9ccb0b5b5f5f1e1c7d8e262a30a/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('ecfa420e97b728b469b7e47f36efaac5d0f12ca595a938823cade3fa735aba6f')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py install --root="$pkgdir" --optimize=1
}
