# Maintainer: Corentin Cadiou <contact@cphyc.me>
pkgname=python-mopidy-qobuz
_module_name=Mopidy-Qobuz
pkgver=0.0.1
pkgrel=1
pkgdesc="Mopidy extension for playing music from Qobuz.."
arch=(any)
url="https://github.com/taschenb/mopidy-qobuz"
license=('Apache2')
depends=('mopidy' 'python-pykka' 'python-qobuz')
options=(!emptydirs)
source=("https://files.pythonhosted.org/packages/source/${_module_name::1}/$_module_name/$_module_name-$pkgver.tar.gz")
sha256sums=('0bfa07505347b5243ac68722575bc76d56f17cde32a4c04dc93490ac52c4cda8')

build() {
  cd "$srcdir/${_module_name}-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/${_module_name}-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
