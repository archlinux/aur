# Maintainer: Marko Semet <marko10_000@mailbox.org>
pkgname=buildstream-plugins-container
pkgver=0.4.1
pkgrel=1
pkgdesc="A collection of BuildStream plugins that are related to containers."
arch=(any)
url="https://buildstream.build"
license=('LGPL')
depends=(
    buildstream
    python-requests
)
makedepends=(git python-setuptools)
source=("git+https://gitlab.com/BuildStream/bst-plugins-container.git#tag=0.4.1&commit=936fb9d941ced5db3a719487b951e0b0f9bd8f21")
sha256sums=('SKIP')

build() {
  cd bst-plugins-container
  python setup.py build
}

package() {
  cd bst-plugins-container
  python setup.py install --root="$pkgdir/" --skip-build
}
