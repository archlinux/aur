# Maintainer: Josip Ponjavic <josipponjavic at gmail dot com>

pkgname=livedumper-git
pkgver=v0.3.0.r5.gf644128
pkgrel=2
pkgdesc="Livestreamer stream dumper"
arch=('any')
url="https://github.com/m45t3r/livedumper"
license=('custom: Simplified BSD')
depends=('livestreamer' 'python-appdirs' 'python-requests')
makedepends=('git' 'python-setuptools')
provides=('livedumper')
conflicts=('livedumper')
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd livedumper
  git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

package() {
  cd livedumper
  python setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
