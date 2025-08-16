# Maintainer: ObserverOfTime <chronobserver@disroot.org>

pkgname=django-template-lsp
pkgver=1.2.0
pkgrel=1
pkgdesc='Django Template Language Server (LSP)'
arch=(any)
url=https://github.com/fourdigits/django-template-lsp
license=(MIT)
depends=(python-jedi python-pygls)
makedepends=(git python-build python-installer python-setuptools python-wheel)
source=("git+$url.git#tag=$pkgver")
b2sums=('cc6e2cfeb3b331a27a905c467a4c17489565c4c2810ecdacc33820b832b156d94a5d6cdc1b2fa4ec6c183db2bb694f923b08eb116e13c77a24e6e0f8adae69b6')

build() {
  cd $pkgname
  python -m build --wheel --no-isolation
}

package() {
  cd $pkgname
  python -m installer --destdir="$pkgdir" dist/*.whl
}
