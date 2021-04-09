# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python2-lazy-object-proxy
pkgver=1.5.0
pkgrel=1
pkgdesc='A fast and thorough lazy object proxy'
arch=('x86_64')
url="https://github.com/ionelmc/python-lazy-object-proxy"
license=('BSD')
makedepends=('python2-setuptools')
source=("$pkgbase-$pkgver.tar.gz::https://github.com/ionelmc/python-lazy-object-proxy/archive/v$pkgver.tar.gz")
sha512sums=('150f2fc240611175697ad638cf85f88bed6534b13cd39ea2d5103292b1c7a1825918738a6ad689940ce9f906f064077ad1fe2b036f6dff3f6f5d31bf43d817d7')

build() {
  cd "$srcdir"/python-lazy-object-proxy-$pkgver
  python2 setup.py build
}

package_python2-lazy-object-proxy() {
  depends=("python2")

  cd python-lazy-object-proxy-$pkgver
  python2 setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
