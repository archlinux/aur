# Maintainer: Jeremy Attali <contact@jtheoof.me>

pkgname=ttf-menomonia
pkgver=1.1.2
pkgrel=1
pkgdesc='Font family for Menomonia, a font used in Guild Wars 2'
arch=('any')
license=(custom)
url="https://github.com/jtheoof/ttf-menomonia"
makedepends=('fontforge' 'python-fonttools')
source=("https://github.com/jtheoof/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=(
  '9054cee935b2a3142153302c55a22a0436e802a23b1486cb4390407cfce1d481'
)

build() {
  cd "${pkgname}-${pkgver}"
  make build
}

package() {
  echo $srcdir
  install -Dm644 -t "${pkgdir}/usr/share/fonts/${pkgname#ttf-}" \
    ${srcdir}/${pkgname}-${pkgver}/menomonia-fonts-ttf-${pkgver}/*.ttf
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" \
    ${srcdir}/${pkgname}-${pkgver}/LICENSE
}
