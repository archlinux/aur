# Maintainer:  Johannes Schlatow <johannes.schlatow@googlemail.com>

pkgname=python-pgpmime-nopyassuan-git
pkgver=20140213
pkgrel=1
pkgdesc="Fork of python-pgpmime that does not require pyassuan"
arch=('any')
url="https://github.com/ValiValpas/pgp-mime"
license=('GPL3')
depends=('python' 'python-pygpgme')
makedepends=('git')
provides=('python-pgpmime')
conflicts=('python-pgpmime-git')
source=("$pkgname"::'git+https://github.com/ValiValpas/pgp-mime.git')
md5sums=("SKIP")

pkgver() {
    cd "$srcdir/$pkgname"
    git describe | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

package() {
    cd "$srcdir/$pkgname"
    python setup.py install --root="${pkgdir}"
}
