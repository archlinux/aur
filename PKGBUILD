# Maintainer: BlackFuffey <fluffistical@gmail.com>

_name=cloudpathlib
pkgname=python-${_name}-bin
pkgver=0.24.0
pkgrel=1
pkgdesc='Python pathlib-style classes for cloud storage services such as Amazon S3, Azure Blob Storage, and Google Cloud Storage.'
arch=(any)
url="https://github.com/drivendataorg/$_name"
license=('MIT')
depends=('python-typing_extensions' 'python-pydantic-core' 'python-importlib-metadata')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel' 'python-flit-core')
provides=("python-cloudpathlib")
conflicts=("python-cloudpathlib")
source=('https://files.pythonhosted.org/packages/c2/5b/ba933f896d9b0b07608d575a8501e2b4e32166b60d84c430a4a7285ebe64/cloudpathlib-0.24.0-py3-none-any.whl' "https://github.com/drivendataorg/cloudpathlib/raw/refs/tags/v${pkgver}/LICENSE")
b2sums=('a815b5338b99489dfe5928a5c5d854eb1593cbf2e4fe282402614604727c00d418077d96496acb1ecf1832ba9f56693fa6bbb0e34dafd0d8ca0346cf8807c6f2'
        '98a5980106760131fc6267156b73980d3fb944761a5025c5db5b3f850df5b2c1962b7e21fb0833dd247f8b5de41f69ce63c3eee2bbca72bbce3ad7fb7228e363')

package() {
  python -m installer --destdir="$pkgdir" *.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
