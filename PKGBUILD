# Maintainer: Johannes Wienke <languitar@semipol.de>

pkgname=pass-git-helper
pkgver=5.0.0
pkgrel=1
pkgdesc="A git credential helper interfacing with pass, the standard unix password manager"
arch=(any)
url="https://github.com/languitar/pass-git-helper"
license=('LGPL-3.0-or-later')
depends=('python3' 'pass' 'python-xdg')
makedepends=(git python-setuptools python-build python-installer python-wheel)
source=("https://github.com/languitar/pass-git-helper/archive/v${pkgver}.tar.gz")
sha256sums=('7b3b496f3b4c885f1a4202b773e577bc80497faca875bff38dfc822b0824b11c')

build() {
  cd "${pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${pkgname}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
