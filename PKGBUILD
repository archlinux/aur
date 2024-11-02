# maintainer: mark.blakeney at bullet-systems dot net
# ex-maintainer: Arthur Deierlein <arthur.deierlein@adfinis.com>
_pkgname="rich-argparse"
pkgname="python-$_pkgname"
pkgver=1.6.0
pkgrel=1
pkgdesc="Rich help formatters for argparse and optparse"
url="https://github.com/hamdanal/$_pkgname"
license=(MIT)
arch=(any)
depends=("python>=3.0" "python-rich")
makedepends=("python-build" "python-installer" "python-hatchling")
_pkgtag="$_pkgname-$pkgver"
source=("$_pkgtag.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('2b847fb325f111d4b457a3069f3e8cab8a23c6d326f5cf3c97ec7d1a413cda84')

build() {
  cd "$_pkgtag"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_pkgtag"
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
  python -m installer --destdir="${pkgdir}" dist/*.whl
                                                    }

# vim:set ts=2 sw=2 et:
