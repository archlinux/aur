# Maintainer:  Anton Kudelin <kudelin at proton dot me>
# Contributor: Butui Hu <hot123tea123@gmail.com>

pkgname=python-fastprogress
_pkgname=fastprogress
pkgver=1.0.3
pkgrel=2
pkgdesc='Simple and flexible progress bar for Jupyter Notebook and console'
arch=('any')
url='https://github.com/fastai/fastprogress'
license=('Apache')
depends=('ipython' 'python-matplotlib' 'python-google-auth')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('419702fb678487ea92a83284450b7e1065d16385d7f97497521e27d46d4931bc')

build() {
  cd "$_pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir" -O1 --skip-build
}
