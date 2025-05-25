# maintainer: mark.blakeney at bullet-systems dot net
# ex-maintainer: Arthur Deierlein <arthur.deierlein@adfinis.com>
_pkgname="rich-argparse"
pkgname="python-$_pkgname"
pkgver=1.7.1
pkgrel=1
pkgdesc="Rich help formatters for argparse and optparse"
url="https://github.com/hamdanal/$_pkgname"
license=(MIT)
arch=(any)
depends=("python>=3.0" "python-rich")
makedepends=("python-build" "python-installer" "python-hatchling")
_pkgtag="$_pkgname-$pkgver"
source=("$_pkgtag.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('dd95042fb3d6be20dbab39b3ee88dee51cc8d8bf522e8c24ce790f9b236167a8')

build() {
  cd "$_pkgtag"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_pkgtag"
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
                                                    }

# vim:set ts=2 sw=2 et:
