# Maintainer: ObserverOfTime <chronobserver@disroot.org>

pkgname=django-template-lsp
pkgver=0.9.5
pkgrel=1
pkgdesc='Django Template Language Server (LSP)'
arch=(any)
url=https://github.com/fourdigits/django-template-lsp
license=(MIT)
depends=(python-jedi python-pygls)
makedepends=(git python-build python-installer python-setuptools python-wheel)
source=("git+$url.git#tag=$pkgver")
b2sums=('15f3bbee41106835af6d378c627d87e8324d68afef8c7cf17a000034114163da031a66d03d0bd5b6c417916dceef43f625b558eb1bdb9941aab127486e1efb0d')

build() {
  cd $pkgname
  python -m build --wheel --no-isolation
}

package() {
  cd $pkgname
  python -m installer --destdir="$pkgdir" dist/*.whl
}
