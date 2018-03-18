# Maintainer of this PKGBUILD file: Martino Pilia <martino.pilia@gmail.com>
_pkgname=pypi2pkgbuild
pkgname=python-$_pkgname
pkgver=0.1
pkgrel=1
pkgdesc="Convert PyPI packages to Arch Linux packages"
arch=('any')
url="https://github.com/anntzer/pypi2pkgbuild"
license=('MIT')
depends=('python-pip' 'namcap' 'pkgfile')
makedepends=('python-setuptools')
conflicts=('python-pypi2pkgbuild-git')
source=("https://github.com/anntzer/pypi2pkgbuild/archive/v${pkgver}.tar.gz")
sha512sums=('8aff0909d9fb334ee7280d4bd9bbf1a17cf89d347fc66901f1299f6e0b426ecb7be787664a086469de048d041b5e17d2394caed1cdf7da1b8c174336364b89c9')

package() {
	cd "$srcdir/$_pkgname-$pkgver"
	install -D -m644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	python setup.py install --optimize=1 --root="$pkgdir"
}
