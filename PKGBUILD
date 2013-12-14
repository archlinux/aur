# Maintainer: mutantmonkey <aur@mutantmonkey.in>
pkgname=python2-houdinipy
pkgver=0.1.0
pkgrel=1
pkgdesc="A Python binding for Houdini that provides (un)escaping functions for HTML, URLs/URIs and Javascript."
arch=('i686' 'x86_64')
url="http://python-houdini.61924.nl/"
license=('MIT')
depends=('python2')
options=(!emptydirs)
source=("https://pypi.python.org/packages/source/h/houdini.py/houdini.py-${pkgver}.tar.gz"
        'LICENSE')
sha256sums=('cabd10734a859c34c3707ecb99b93cb78547a9128cbfabbe3f4d5628e822f666'
            '0fed45cfa40d1ceed4bf0173f11af10e962d2647a4beb7c0e8250a30720a1890')

package() {
  cd "$srcdir/houdini.py-$pkgver"
  python2 setup.py build
}

package() {
  cd "$srcdir/houdini.py-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
  install -D -m644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
