# Maintainer: Morten Linderud <foxboron@archlinux.org>
# Contributor: Antoine Damhet <antoine.damhet@lse.epita.fr>

pkgname=b4
pkgver=0.12.4
pkgrel=1
pkgdesc='Helper utility to work with patches made available via a public-inbox archive like lore.kernel.org.'
license=('GPL')
arch=('any')
url='https://git.kernel.org/pub/scm/utils/b4/b4.git/'
makedepends=('git' 'python-setuptools')
depends=('python-requests' 'git-filter-repo' 'patatt')
source=("https://mirrors.edge.kernel.org/pub/software/devel/b4/${pkgname}-${pkgver}.tar."{xz,sign})
validpgpkeys=('DE0E66E32F1FDD0902666B96E63EDCA9329DD07E')
sha256sums=('5786329250f9d14af8f1b6227b388312c570cb89f94b5a6befb49db8ea1fbcc0'
            'SKIP')

build() {
	cd "$pkgname-$pkgver"
	python setup.py build
}

package() {
	cd "$pkgname-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
