# Maintainer: Philipp Joram <mail [at] phijor [dot] me>

pkgname='python-soundcloud-v2'
_name=soundcloud_v2
pkgver=1.7.0
pkgrel=1
pkgdesc="Python wrapper for the v2 SoundCloud API"
url="https://github.com/7x11x13/soundcloud.py"
arch=('any')
license=('MIT')
depends=(
  'python'
  'python-dateutil'
  'python-dacite'
  'python-requests'
)
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
conflicts=('python-soundcloud')
provides=('python-soundcloud')
#source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
source=("https://files.pythonhosted.org/packages/f1/87/abf8b9f9075c908b4433ee31ca856f9be068dc4315a71e05e9a384ba3a1f/soundcloud_v2-1.7.0.tar.gz")
sha512sums=('6d3e18be9a1b1773d2da7d12d9f481c65d76f368430f9dfe62c943a4bf51c28eea5ca6c8280f2c9a43c1aabf243d6716b02cc91541baf35ed61bb142a24592f4')

build() {
  cd "${_name}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${_name}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl

  # Install MIT license file:
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
