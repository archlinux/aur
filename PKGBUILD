# Maintainer: Qiu Wenbo <qiuwenbo@gnome.org>

pkgname=kas
pkgver=5.4
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
sha512sums=('5bf549ec9f8bccaa2adfd77387e3a267a5afe281f30efb0a3b3d116a47e1d87fc3bcfeeedd5f08d0bacfda97fe5aa39f7fdb6ea6a30f15e99ad6473b442bec8b')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}
