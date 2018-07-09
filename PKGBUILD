# Maintainer: Cyker Way <cykerway at gmail dot com>

pkgname=blrm-git
pkgver=r25.37ba33c
pkgrel=1
pkgdesc="A wrapper of rm command with user-defined blacklist."
arch=('any')
url="https://repo.cykerway.com/blrm"
license=('GPL3')
groups=()
depends=('python')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install=
source=('git+https://github.com/cykerway/blrm.git')
noextract=()
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/${pkgname%-git}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$srcdir/${pkgname%-git}"
}

build() {
    cd "$srcdir/${pkgname%-git}"
}

check() {
    cd "$srcdir/${pkgname%-git}"
}

package() {
    cd "$srcdir/${pkgname%-git}"

    python setup.py install --root="$pkgdir/" --optimize=1

    install -Dm644 \
    "$srcdir/${pkgname%-git}/LICENSE.txt" \
    "$pkgdir/usr/share/licenses/blrm/LICENSE.txt"

    install -Dm644 \
    "$srcdir/${pkgname%-git}/README.rst" \
    "$pkgdir/usr/share/blrm/README.rst"

    install -Dm644 \
    "$srcdir/${pkgname%-git}/share/blrm.conf.example" \
    "$pkgdir/usr/share/blrm/blrm.conf.example"

    install -Dm644 \
    "$srcdir/${pkgname%-git}/share/blacklist.example" \
    "$pkgdir/usr/share/blrm/blacklist.example"
}

