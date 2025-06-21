# Maintainer: Qiu Wenbo <qiuwenbo@gnome.org>

pkgname=kas
pkgver=4.8.1
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
sha512sums=('6c6fd2df1a79711405ee1e902d20503fdb584a2c2d89322e43a89594787b7b2b2931ee2670495a9f0d9428f3e368661e772d8ebfbd9364d2ee37ec97d5f6c268')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}
