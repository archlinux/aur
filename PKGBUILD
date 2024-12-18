# Maintainer: atomicfs <https://aur.archlinux.org/account/atomicfs>

pkgname=robotframework
pkgver=7.1.1
pkgrel=1
pkgdesc="A keyword-driven test automation framework"
arch=('any')
url="http://www.robotframework.org"
license=('Apache-2.0')
depends=('python')
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
source=("https://github.com/$pkgname/$pkgname/archive/v$pkgver.tar.gz")
sha512sums=('50095a9191191a67592680846b8a9a98d0c439f77d96516b530fd0fa2a3829fe97df01c4883836160f99e1044a8801a2b49fb773f974c8ff0fb5718ef3dc7526')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
}
