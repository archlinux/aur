# Maintainer: Gildásio Júnior <gildasiojunior @at@ riseup .dot. net>

pkgname=wappalyzer-next-git
_pkgname=${pkgname%-git}
pkgver=r43.dd1651f
pkgrel=1
pkgdesc="wappalyzer alternative based on wappalyzer browser extension"
arch=(any)
url="https://github.com/s0md3v/wappalyzer-next"
license=(GPL-3.0-or-later)
conflicts=()
provides=(wappalyzer)
depends=(
  python
  python-requests
  python-huepy
  python-selenium
  python-tldextract
  python-beautifulsoup4
  python-dnspython
)
makedepends=(
    git
    python-setuptools
)
source=("git+https://github.com/s0md3v/wappalyzer-next")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$_pkgname"
  python setup.py build
}

package() {
  cd "$_pkgname"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

# vim:set ts=2 sw=2 et:
