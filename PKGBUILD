# Maintainer: Ido Rosen <ido@kernel.org>

pkgname=llm
pkgver=0.28
pkgrel=1
pkgdesc='A CLI tool and Python library for interfacing with popular large language models.'
arch=(any)
url='https://github.com/simonw/llm'
license=(Apache-2.0)
depends=(python
         python-numpy
         python-click
         python-condense-json
         python-openai
         python-click-default-group
         sqlite-utils
         python-sqlite-migrate
         python-pydantic
         python-pyyaml
         python-pluggy
         python-ulid
         python-puremagic
         python-httpx)
makedepends=(python-build
             python-setuptools
             python-installer
             python-wheel)
#checkdepends=(python-pytest
#              python-pytest-httpx
#              python-pytest-asyncio
#              python-cogapp
#              mypy python-pytest-mypy
#              python-black
#              python-pytest-recording
#              python-ruff
#              python-pytest-ruff
#              python-syrupy
#              ...)
#optdepends=('xyz: for xyz')
source=($pkgname-$pkgver.tar.gz::https://github.com/simonw/llm/archive/refs/tags/$pkgver.tar.gz)
sha256sums=('7c95ab264f1b4ba612c696801bef5b33cb0c974203cd391f46e163dddd358335')

build() {
    cd $pkgname-$pkgver
    python -m build --wheel --no-isolation
}

#check() {
#    cd $pkgname-$pkgver
#    pytest -v
#}

package() {
    cd $pkgname-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
}
