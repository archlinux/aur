# Maintainer: Julien Nicoulaud <julien.nicoulaud@gmail.com>
# Source: https://github.com/nicoulaj/archlinux-packages
pkgname=howdoi
pkgver=1.1.12
pkgrel=1
pkgdesc="A code search tool."
arch=(any)
url="https://github.com/gleitz/howdoi"
license=(MIT)
depends=('python-pygments>=2.1.1'
         'python-argparse>=1.4.0'
         'python-cssselect>=0.9.1'
         'python-lxml>=3.5.0'
         'python-pyquery>=1.2.11'
         'python-requests>=2.9.1'
         'python-requests-cache>=0.4.11')
makedepends=(python-distribute)
changelog=Changelog
conflicts=(${pkgname}-git)
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/${pkgname}/${pkgname}-${pkgver}.tar.gz")
md5sums=('1f7ccc3e875d1050eb4552bf197b13c3')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py install --root="$pkgdir/" --optimize=1
}
