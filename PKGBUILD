# Maintainer: Franklyn Tackitt <franklyn@tackitt.net>
_author=tony
_python_pkgname=libtmux
pkgname=python-${_python_pkgname}
pkgver=0.6.1
pkgrel=1
pkgdesc="python api for tmux http://libtmux.readthedocs.io/"
arch=(any)
url="https://github.com/tony/libtmux"
license=('BSD')
depends=('python' 'python-argcomplete' 'python-kaptan' 'python-colorama')
options=(!emptydirs)
source=("https://github.com/${_author}/${_python_pkgname}/archive/v${pkgver}.tar.gz")
md5sums=('26e815b7d418dff9fa35e0b1f1400bb1')

package() {
  cd "$srcdir/${_python_pkgname}-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1

  install -D -m 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
