# Maintainer: Adam Poniatowski <adam@poniatowski.dev>
pkgname=python-awscli-local
_pkgname=awscli-local
pkgver=0.22.0
pkgrel=1
pkgdesc="A thin wrapper around the AWS CLI to use AWS services locally via LocalStack (awslocal command)"
arch=('any')
url="https://github.com/localstack/awscli-local"
license=('Apache')
depends=('python' 'aws-cli' 'python-botocore')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/25/f9/023c80ea27d67b0930f116597fd55a93f84de9b05d18b38c7d2d5d75c1c9/awscli-local-$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1
}
