# Maintainer: Kaizhao Zhang <zhangkaizhao@gmail.com>

pkgname=chruby-fish
pkgver=0.8.2
pkgrel=1
pkgdesc="Thin wrapper around chruby to make it work with the Fish shell"
arch=(any)
url="https://github.com/JeanMertz/chruby-fish"
license=('MIT')
depends=('chruby' 'fish')
install=${pkgname}.install

source=("https://github.com/JeanMertz/chruby-fish/archive/v${pkgver}.tar.gz"
        chruby-root.patch)
sha256sums=('e3726d39da219f5339f86302f7b5d7b62ca96570ddfcc3976595f1d62e3b34e1'
            'a2f186f1dd1e7adc62d8315617443e0771f5d5ff7c3dee9794bcf0327c2d33fd')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  patch -p0 -i ../chruby-root.patch
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make PREFIX="${pkgdir}/usr" install >/dev/null
}
