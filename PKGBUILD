# Maintainer: Slithery <aur at slithery dot uk>
pkgname=linode-cli-dev
_pkgbase=linode-cli
pkgver=1.0.9b0
pkgrel=1
pkgdesc="CLI for the new Linode API v4"
arch=('any')
url="https://github.com/linode/$_pkgbase"
license=('BSD')
depends=('python' 'python-colorclass' 'python-future' 'python-linode-api' 'python-requests' 'python-setuptools'  'python-terminaltables')
conflicts=('linode-cli')
source=("$url/archive/v$pkgver.zip"
        "LICENSE")
sha256sums=('3b85c7530644a77c309d0f4d8fd0eb103c3dc87bff44f6f9f074bf72937ee3b6'
            'df9d91c16177692600704b6031d51540e9421093be465f1778c2a6433b0cd1c1')

package() {
  cd "$srcdir/$_pkgbase-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 "$srcdir"/LICENSE "$pkgdir/usr/share/licenses/$_pkgbase/LICENSE"
}
