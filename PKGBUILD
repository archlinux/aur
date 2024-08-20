# Maintainer: loukii
pkgname=python-phone
pkgver="0.4.5"
pkgrel=1
arch=('any')

url='https://github.com/ls0f/phone'
pkgdesc='Chinese Mobile phone number location database, data. 手机号码归属地库, 数据更新 2023-12'
license=('MIT')

_name=${pkgname#python-}

source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")

sha256sums=('96d2f83c1698155227ca143abd8b1d50d04a46f5764ddee6b03ebe60a55037ec')

depends=()

makedepends=('python-setuptools')

build() {
  cd "$_name-$pkgver"
  python setup.py build
}

package() {
  cd "$_name-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}