# Maintainer: Oliver Sherouse <oliver@oliversherouse.com>
pkgname=yo-runner
_name=${pkgname#python-}
pkgver=0.1.1
pkgrel=1
pkgdesc="A Yaml-driven task runner for lazy people"
arch=('any')
url="https://OliverSherouse.github.io/yo-runner"
license=('GPL')
depends=('python-yaml' 'python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
md5sums=('c0cb3bbe43cda6195351b434f242b3a2')

build() {
    cd "$pkgname-$pkgver"
    sed -is "s/distutils\.core/setuptools/" setup.py
    python setup.py build
}

package() {
    cd "$pkgname-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
