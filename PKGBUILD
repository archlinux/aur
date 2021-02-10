# Maintainer: Anty0 <anty150 at gmail dot com>

pkgname='python-urwid_readline'
_pkgname='urwid_readline'
pkgver='0.12'
pkgrel=1
pkgdesc="Text input widget for urwid that supports readline shortcuts"
url="https://github.com/rr-/urwid_readline"
depends=('python'
    'python-urwid')
makedepends=('cython' 'python-setuptools')
license=('mit')
arch=('i686' 'x86_64' 'arm' 'armv7h' 'armv6h' 'aarch64')
source=("https://github.com/rr-/urwid_readline/archive/${pkgver}.tar.gz")
sha256sums=('f9688392c0bdeb00732b6f3c01cfd269b6f8fcc2553bec92947aa71af5ebd864')

build() {
    cd "${srcdir}/${_pkgname}-${pkgver}/"
    python setup.py build_ext --inplace
}

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}/"
    python setup.py install --root="${pkgdir}"
    install -D -m644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}
