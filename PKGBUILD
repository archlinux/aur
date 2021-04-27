# Maintainer: Liam Timms <timms5000@gmail.com>

pkgname=python-kmeans1d
_pkgname=kmeans1d
pkgver=0.3.1
pkgrel=1
pkgdesc='convenient access to the OpenAI API from applications written in the Python language.'
arch=('any')
url='https://openai.com/'
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
optdepends=()
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/dstein64/${_pkgname}/archive/v${pkgver}.tar.gz")
sha512sums=('ab2999e839fc584ecd05251374eef0122b8b44d512d7d441db783d5a3e2a1f5342b3f2d65f85f6f27969bdee179f02b881cdfda104f5da9bed0caa6d60c6b9a9')

build()
{
  	cd "$srcdir/${_pkgname}-$pkgver"
  	python setup.py build
}


package()
{
  	cd "$srcdir/${_pkgname}-$pkgver"
	python setup.py install --skip-build --root="$pkgdir" --optimize=1
    # install -Dm644 COPYING -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

