# Maintainer: Philipp Joram <mail [at] phijor [dot] me>

pkgname='python-soundcloud-v2'
_name=${pkgname#python-}
pkgver=1.3.1
pkgrel=1
pkgdesc="Python wrapper for the v2 SoundCloud API"
url="https://github.com/7x11x13/soundcloud.py"
arch=('any')
license=('MIT')
depends=(
  'python'
  'python-dateutil'
  'python-dacite'
)
makedepends=('python-setuptools')
conflicts=('python-soundcloud')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha512sums=('d02c3f5ea2545e75064fb269a78c609fe45fae4a441d63825996145cb870142a2d4a0bdf820fee2d86c621937943e6e72decb308572b256085d73d1df4919967')

build() {
  cd "${_name}-${pkgver}"
  python setup.py build
}

package() {
  cd "${_name}-${pkgver}"
  python setup.py install --root="$pkgdir" --optimize=1
}

# vim:set ts=2 sw=2 et:
