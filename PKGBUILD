# Contributor: Lex Black <autumn-wind@web.de>
# Contributor: Joseph Lansdowne <J49137@gmail.com>

pkgname=pyroom
pkgver=0.5.0
pkgrel=1
pkgdesc='distraction-free text editor'
arch=(any)
url="https://github.com/quintusfelix/pyroom"
license=(GPL3)
depends=(python-gobject python-pyxdg)
makedepends=(python)
source=(${url}/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.gz)
b2sums=('472444869cfd998aeb618b13e3ab1da7908a806dcee758747d3e331bdf3b2267f186fac755787a50c720a169058a14d8fd8b3d86797c67e831fce1d8d5351c32')


build() {
    cd "$pkgname"
    python setup.py build
}

package() {
    cd "$pkgname"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build

    # additional stuff not covered by setup.py
    install -D ${pkgname}.1 ${pkgdir}/usr/share/man/man1/${pkgname}.1
}

