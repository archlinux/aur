# SPDX-FileCopyrightText: © 2026 Patrick X. Gray <patrick@xgray.io>
# SPDX-License-Identifier: 0BSD
# Maintainer: Your Patrick X. Gray <patrick@xgray.io>
pkgname=python-huggingface_hub
_name=${pkgname#python-}
pkgver=1.10.2
pkgrel=1
pkgdesc="The official Python client for the Hugging Face Hub"
arch=('any')
url="https://github.com/huggingface/huggingface_hub"
license=('Apache 2.0')
depends=('python>=3.6' 'python-filelock' 'python-fsspec' 'python-httpx' 'python-packaging' 'python-pyaml' 'python-tqdm' 'python-typer' 'python-typing_extensions')
makedepends=('python-build' 'python-installer' 'python-wheel')
provides=("python-huggingface_hub=${pkgver}")
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name//-/_}/${_name//-/_}-$pkgver.tar.gz")
sha256sums=('4b276f820483b709dc86a53bcb8183ea496b8d8447c9f7f88a115a12b498a95f')

build() {
	cd $_name-$pkgver
	python -m  build --wheel --no-isolation
}

package() {
	cd $_name-$pkgver
	python -m installer --destdir="$pkgdir" dist/*.whl
}
