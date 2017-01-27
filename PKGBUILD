# Maintainer: Maikel Wever <maikelwever@gmail.com>

pkgname=python-pipfile
pkgver=0.0.1
pkgrel=1
pkgdesc="Pipfile and its sister Pipfile.lock are a replacement for the existing standard pip's requirements.txt file."
url="https://github.com/pypa/pipfile"
license=('Apache' 'BSD')
depends=('python' 'python-toml')
makedepends=('python-setuptools')

# TODO: When github releases begin to exist use those as source url
# source=("https://github.com/pypa/pipfile/archive/v${pkgver}.tar.gz")
source=("https://pypi.python.org/packages/08/3d/6a46d06d3b68ef766121c55391ba0bec123de76ca10d7323329e14777cda/pipfile-${pkgver}.tar.gz")

md5sums=('1134e13177eceb39c6c93e3c34415db4')
arch=('any')

package() {
  cd "$srcdir/pipfile-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -D -m644 LICENSE.BSD "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.BSD"
}

# vim:set ts=2 sw=2 et:
