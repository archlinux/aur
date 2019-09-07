# Maintainer: Anty0 <anty150 at gmail dot com>

pkgname='python-urwid_readline'
_pkgname='urwid_readline'
pkgver='0.10'
pkgrel=1
pkgdesc="Text input widget for urwid that supports readline shortcuts"
url="https://github.com/rr-/urwid_readline"
depends=('python'
    'python-urwid')
makedepends=('cython' 'python-setuptools')
license=('mit')
arch=('x86_64')
source=("https://github.com/rr-/urwid_readline/archive/${pkgver}.tar.gz")
sha256sums=('212ab9a430cd6c2e1c3d420ce58986c659e035f0dc4756f3c3e51f29fc218b6e')

build() {
    cd "${srcdir}/${_pkgname}-${pkgver}/"
    python setup.py build_ext --inplace
}

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}/"
    python setup.py install --root="${pkgdir}"
    install -D -m644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}
