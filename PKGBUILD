# Maintainer: Gerard Ribugent <ribugent <at> gmail <dot> com>
pkgname=python-dbx
_name=dbx
pkgver=0.6.12
pkgrel=1
pkgdesc="DataBricks CLI eXtensions - aka dbx is a CLI tool for advanced Databricks jobs management."
arch=(any)
url="https://docs.databricks.com/dev-tools/dbx.html"
license=('CUSTOM')
depends=(
	'python>=3.8'
	"python-databricks-cli>=0.16.4"
	"python-click>=7.1.2"
	"python-retry>=0.9.2"
	"python-requests>=2.24.0"
	"python-mlflow>=1.23.0"
	"python-scipy>=1.8.0"
	"python-tqdm>=4.50.0"
	"python-azure-identity>=1.7.1"
	"python-azure-mgmt-datafactory>=2.2.0"
	"python-azure-mgmt-subscription>=3.0.0"
	"python-ruamel-yaml>=0.17.10"
	"python-cryptography>=3.3.1" "python-cryptography<38.0.0"
	"python-emoji>=1.6.1"
	"python-cookiecutter>=1.7.2"
	"python-jinja>=2.11.2"
)
makedepends=(python-build python-installer python-wheel)
source=($pkgname-$pkgver.tar.gz::https://github.com/databrickslabs/dbx/archive/refs/tags/v$pkgver.tar.gz)
sha512sums=('9564daab271409f5734d06595b9dafdb8f83dd12c5b647d31a59707011805fed2e2f4665b4c9a57c51d002974e8ae135e88d48c0dfbf77ec1aaaff98536c2556')

build() {
	cd "$_name-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "$_name-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
}
