# Maintainer: Bruno Miguel <bruno@privacyrequired.com>

pkgname=shellpic-git
short_pkgname=shellpic
pkgver=1.6.2.94f1a18
pkgrel=2
pkgdesc="Shellpic uses escape codes to display images in a terminal, IRC or NUTS client. -ASCII-art is so 2013."
arch=("any")
url="https://github.com/larsjsol/shellpic"
license=("GPL-3.0")
depends=("python" "python-pillow")
conflicts=("shellpic")
source=("git+https://github.com/larsjsol/${short_pkgname}")
sha256sums=('SKIP')

pkgver() {
    cd ${short_pkgname}
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)//;s/-/./g'
}

package() {
    cd "${srcdir}/${short_pkgname}"
    python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1
    install -Dm755 LICENSE "$pkgdir/usr/share/licenses/$short_pkgname/LICENSE"
}

# vim:set ts=4 sw=4
