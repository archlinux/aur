# Maintainer: Qiu Wenbo <qiuwenbo@gnome.org>

pkgname=kas
pkgver=5.2
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
sha512sums=('c9f38f66f68d1b59e5f8bc629cd7808f2e0ca13173e21d0521eb382666c7f12cfd14dba072c5316aae997318044061606c4a0258fe32c6c824a488337e014b3d')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}
