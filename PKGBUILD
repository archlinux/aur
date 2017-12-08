# Maintainer Ankit R Gadiya <git@argp.in>

pkgname=ufo2otf-git
pkgver=r9.9025ba2
pkgrel=1
pkgdesc="Take UFO font sources and generate OTF’s and webfonts"
arch=('any')
url="https://github.com/fonts/ufo2otf"
depends=('python2'
         'fontforge')
makedepends=('git'
             'python-setuptools')
license=('BSD 3-Clause')
source=("git+https://github.com/fonts/${pkgname%-git}")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/${pkgname%-git}"
  python2 setup.py -q install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE.txt $pkgdir/usr/share/licenses/${pkgname}/LICENSE
}
