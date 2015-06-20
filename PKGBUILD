# Maintainer:  Johannes Schlatow <johannes.schlatow@googlemail.com>

pkgname=python-pyplothelper-git
pkgver=20140210
pkgrel=1
pkgdesc="A collection of scripts that facilitate the creation of fancy plots with matplotlib."
arch=('any')
url="https://github.com/ValiValpas/pyplot_helper/"
license=('MIT')
depends=('python' 'python-matplotlib' 'python-numpy' 'python-brewer2mpl')
makedepends=('git')
provides=('python-pyplothelper')
source=("$pkgname"::'git+git://github.com/ValiValpas/pyplot_helper')
md5sums=("SKIP")

pkgver() {
    cd "$srcdir/$pkgname"
    git describe | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

package() {
    cd "$srcdir/$pkgname"
    python setup.py install --root="${pkgdir}"
}
