# Maintainer: Qiu Wenbo <qiuwenbo@gnome.org>

pkgname=kas
pkgver=5.1
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
sha512sums=('a399f248eb9a1d39a95c525ae43f642db1096a57b2caf94397af80e99cbb218a905186661b850d72b1f3997b7b10782a53980cac793f7859ee95d633f355e583')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}
