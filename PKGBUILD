# Maintainer: Morten Linderud <foxboron@archlinux.org>
# Contributor: Antoine Damhet <antoine.damhet@lse.epita.fr>

pkgname=b4
pkgver=0.7.1
pkgrel=1
pkgdesc='Helper utility to work with patches made available via a public-inbox archive like lore.kernel.org.'
license=('GPL')
arch=('any')
url='https://git.kernel.org/pub/scm/utils/b4/b4.git/'
makedepends=('git' 'python-setuptools')
depends=('python-requests')
source=("https://mirrors.edge.kernel.org/pub/software/devel/b4/${pkgname}-${pkgver}.tar."{xz,sign})
validpgpkeys=('DE0E66E32F1FDD0902666B96E63EDCA9329DD07E')
sha256sums=('1a9187ec617a73ebca4e468b225cbe7e76544169af8d70668ced106d7c8ea342'
            'SKIP')

build() {
	cd "$pkgname-$pkgver"
	python setup.py build
}

package() {
	cd "$pkgname-$pkgver"
	export PYTHONHASHSEED=0
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
