# Maintainer: Qiu Wenbo <qiuwenbo@gnome.org>

pkgname=kas
pkgver=4.8.2
pkgrel=1
pkgdesc="Setup tool for bitbake based projects "
arch=(any)
url="https://github.com/siemens/kas"
license=('CUSTOM')
depends=('python' 
	 'python-yaml' 
	 'python-distro' 
	 'python-jsonschema' 
	 'python-kconfiglib'
         'python-gitpython'
        )
optdepends=('libnewt: text based ui of menu plugin')
makedepends=('python-setuptools')
source=($pkgname-$pkgver.tar.gz::$url/archive/refs/tags/${pkgver}.tar.gz)
sha512sums=('09ee32f756ac90c229d1942f4191a4e24bef70ac042c5958a8599e2238a1e01bc280c26b021da49fc4f3f4566cc6b6aa4f33a04be3a10bf1ec0e5876600465f3')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}
