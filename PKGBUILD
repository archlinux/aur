# Maintainer: David Markey <david@dmarkey.com>

pkgname=python-op-aws-vault
_pyname=${pkgname#python-}
pkgver=0.0.5
pkgrel=1
pkgdesc='aws-vault like utility for 1Password'
arch=(any)
url="https://github.com/dmarkey/$_pyname"
license=(MIT)
depends=(python python-boto3 python-pytimeparse2 python-requests python-typer)
makedepends=(python-{build,installer,wheel,hatchling} python-setuptools)
_archive="op_aws_vault-$pkgver"
source=("https://pypi.python.org/packages/source/o/op-aws-vault/op_aws_vault-${pkgver}.tar.gz")
sha256sums=('7a359da4830a0505503284400dc4f8f8cd0ae893163f17271dd708d2fc82fb30')

build() {
    cd "$_archive"
    python -m build -wn
}

check() {
    cd "$_archive"
}


package() {
    cd "$_archive"
    python -m installer -d "$pkgdir" dist/*.whl
}

