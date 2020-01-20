# Maintainer: piernov <piernov@piernov.org>

pkgname=python-ipython-autotime
pkgver=0.1
pkgrel=1
pkgdesc="Time everything in IPython"
arch=('any')
url="https://github.com/cpcloud/ipython-autotime"
license=('APACHE')
depends=('ipython')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/e6/f9/0626bbdb322e3a078d968e87e3b01341e7890544de891d0cb613641220e6/ipython-autotime-${pkgver}.tar.bz2")
sha512sums=('a75ea3583bde0f7acae3f0f49f0970e0f35f7c3872a660ad2de7128a47d4aec2acfc4d39bab074e357dc595ebdaff966b1adc80e5db501244981a9f029b5cf83')

build() {
  cd ipython-autotime-$pkgver
  python setup.py build
}

package() {
  cd ipython-autotime-$pkgver
  python setup.py install --root "$pkgdir" --prefix=/usr --optimize=1 --skip-build
}
