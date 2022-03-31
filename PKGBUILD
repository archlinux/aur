# Maintainer: Philipp Joram <mail [at] phijor [dot] me>

pkgname='python-soundcloud-v2'
_name=${pkgname#python-}
pkgver=1.3.0
pkgrel=1
pkgdesc="Python wrapper for the v2 SoundCloud API"
url="https://github.com/7x11x13/soundcloud.py"
arch=('any')
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
conflicts=('python-soundcloud')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha512sums=('70fa57dd5f77438806fd5b5ce56cc7330b4a41e00f989d0c097998e90f62de3080d1e03d36d9234d2aaf5537df544e2f07ecc03b69873080f9594126e53e91a4')

build() {
  cd "${_name}-${pkgver}"
  python setup.py build
}

package() {
  cd "${_name}-${pkgver}"
  python setup.py install --root="$pkgdir" --optimize=1
}

# vim:set ts=2 sw=2 et:
