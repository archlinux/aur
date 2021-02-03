# Maintainer: KokaKiwi <kokakiwi+aur@kokakiwi.net>

pkgname=python-libversion
pkgver=1.2.1
pkgrel=1
pkgdesc="Python bindings for libversion"
url='https://pypi.org/project/libversion'
license=('MIT')
arch=('x86_64' 'i686')
depends=('python' 'libversion')
makedepends=('python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/repology/py-libversion/archive/${pkgver}.tar.gz")
sha256sums=('c111bc33e371e41d15a411861a70cee1287c514a2f70da70ee52ab04e6a06368')
b2sums=('5e7d9867b8ebe99f0c7305df3b81d25ae8031d72d29cf9af9d2b264547b17be904ef6395e0f0b78f4add04a8fc6f4eccc1113d969e2f6b60e903fca4cc7824da')

build() {
  cd "py-libversion-${pkgver}"

  python setup.py build
}

package() {
  cd "py-libversion-${pkgver}"

  python setup.py install --root="${pkgdir}" --optimize=1
  install -Dm0644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
