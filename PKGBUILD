# Maintainer: Adam Poniatowski <adam@poniatowski.dev>
pkgname=python-awscli-local
_pkgname=awscli-local
pkgver=0.22
pkgrel=1
pkgdesc="A thin wrapper around the AWS CLI to use AWS services locally via LocalStack (awslocal command)"
arch=('any')
url="https://github.com/localstack/awscli-local"
license=('Apache')
depends=('python' 'aws-cli' 'python-botocore')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1
}
