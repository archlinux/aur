# Maintainer:  Johannes Schlatow <johannes.schlatow@googlemail.com>

pkgname=python-pyplothelper-git
pkgver=r14.9e175cd
pkgrel=1
pkgdesc="A collection of scripts that facilitate the creation of fancy plots with matplotlib."
arch=('any')
url="https://github.com/ValiValpas/pyplot_helper/"
license=('MIT')
depends=('python' 'python-matplotlib' 'python-numpy' 'python-palettable')
makedepends=('git')
provides=('python-pyplothelper')
source=("$pkgname"::'git+https://github.com/ValiValpas/pyplot_helper')
md5sums=("SKIP")

pkgver() {
	cd "$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "$srcdir/$pkgname"
    python setup.py install --root="${pkgdir}"
}
