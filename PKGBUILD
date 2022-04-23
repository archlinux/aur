# Maintainer: Malte Jürgens <maltejur@dismail.de>

pkgname=python-music-tag
_name=${pkgname#python-}
pkgver=0.4.3
pkgrel=1
pkgdesc="Simple interface to edit audio file metadata"
arch=("x86_64")
url="https://github.com/KristoforMaynard/music-tag"
license=("MIT")
depends=(python)
makedepends=(python-setuptools)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=("0aab6e6eeda8df0f5316ec2d2190bd74561b7e03562ab091ce8d5687cdbcfff6")

build() {
  cd $_name-$pkgver
  python setup.py build
}

package() {
  cd $_name-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
}
