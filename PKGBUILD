# Maintainer: Alan Beale <the.mrabz@gmail.com>

_name=fake-useragent
pkgname=python-fake-useragent
pkgver=1.5.1
pkgrel=1
pkgdesc='Up to date simple useragent faker with real world database'
arch=('any')
url=https://github.com/hellysmile/fake-useragent
license=('Apache')
depends=(python python-importlib-metadata)
makedepends=(
  'python-setuptools'
  'python-build'
  'python-installer'
  'python-wheel'
)
source=("https://github.com/fake-useragent/fake-useragent/archive/refs/tags/$pkgver.tar.gz")
sha512sums=('81df90dbdf99f8a360d11e3bcb605e76f80f59b13b5cb54c64016ff3927175378a47e52773bb79cb29a1a09d802479166a3008ef11dd0739d754f7ab057f9bfd')

build() {
  cd $_name-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl #--optimize=1 --skip-build
}

# vim:set ts=2 sw=2 et:
