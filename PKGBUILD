# Maintainer: Cedric Girard <girard.cedric@gmail.com>
# Contributor: Christopher Arndt <aur -at- chrisarndt -dot- de>
# Contributor: Simon Conseil <contact+aur at saimon dot org>

pkgname=pip2-tools
_pythonmod=pip-tools
pkgver=1.9.0
pkgrel=1
pkgdesc="A set of tools to keep your pinned Python dependencies fresh."
arch=('any')
url="https://github.com/jazzband/pip-tools/"
license=('BSD')
depends=('python2-click' 'python2-first' 'python2-pip' 'python2-six')
source=("https://pypi.io/packages/source/${_pythonmod:0:1}/${_pythonmod}/${_pythonmod}-$pkgver.tar.gz"
        LICENSE.txt)
md5sums=('28401a367a9a9c37cac56f76cf7f91d9'
         'b542fe20de254615b3ab48020bc73441')

package() {
  cd ${srcdir}/${_pythonmod}-$pkgver

  python2 setup.py install --root="$pkgdir/" --prefix=/usr --optimize=1
  install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm644 "${srcdir}/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname"
}

# vim:set ts=2 sw=2 et:
