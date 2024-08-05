# Maintainer: David Markey <david@dmarkey.com>

pkgname=python-op-aws-vault
_pyname=${pkgname#python-}
pkgver=0.0.7
pkgrel=1
pkgdesc='aws-vault like utility for 1Password'
arch=(any)
url="https://github.com/dmarkey/$_pyname"
license=(MIT)
depends=(python python-boto3 python-pytimeparse2 python-requests python-typer)
makedepends=(python-{build,installer,wheel,hatchling} python-setuptools)
_archive="op_aws_vault-$pkgver"
source=("https://pypi.python.org/packages/source/o/op-aws-vault/op_aws_vault-${pkgver}.tar.gz")
sha256sums=('ced4e862b263d4768bed9bfc122bf433ff3146def3f26d1742024ff893e2b6fa')

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

