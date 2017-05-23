# Maintainer: lazant <a.l.i.c.e at outlook.com>
pkgbase=python-kivymd
pkgname=('python-kivymd' 'python2-kivymd')
pkgdesc="Set of widgets for Kivy inspired by Google's Material Design."
pkgver=0.1.2
pkgrel=1
arch=('any')
url="https://gitlab.com/kivymd/KivyMD/"
license=('MIT')
source=("$pkgname::https://pypi.python.org/packages/f1/2e/4bec1d1f1d004f54cd00b4013702de9815922df89bc05b562499a9bc1b9d/kivymd-$pkgver.tar.gz"
		"LICENSE")
makedepends=('python-setuptools' 'python2-setuptools')
md5sums=('51bbfb26c19f5010735d5e7213f73626'
         '0e7641c066a04ca2c7c7502026d0fb3e')

prepare() {
  cp -a kivymd-$pkgver{,-python2}
}

package_python2-kivymd() {
  depends=('python2-kivy')
  cd "$srcdir/kivymd-$pkgver-python2"
  python2 setup.py install --root="$pkgdir/" --optimize=1
  install -D -m644 "$srcdir/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_python-kivymd() {
  depends=('python-kivy')
  cd "$srcdir/kivymd-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -D -m644 "$srcdir/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
