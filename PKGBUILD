# Maintainer: Nebulosa  <nebulosa2007-at-yandex-dot-ru>

pkgname=orbitiny-desktop-bin
pkgver=0.1p1
pkgrel=1
pkgdesc="A new, 100% portable, innovative and traditional but modern looking desktop environment for Linux"
arch=(x86_64)
url="https://codeberg.org/sasko-usinov/${pkgname%-bin}"
license=(GPL-3.0-only)
depends=(
  acl
  bash
  dbus
  file
  gcc-libs
  glib2
  glibc
  krb5
  libcap
  zlib
)
provides=(${pkgname%-bin})
conflicts=(${pkgname%-bin})
options=(!debug)
source=("${pkgname%-bin}-$pkgver.tar.gz::$url/raw/branch/main/orbitiny-bin-release/orbitiny-release.tar.gz")
noextract=("${pkgname%-bin}-$pkgver.tar.gz")
sha512sums=('aa862ba63f45ee7e0c90559ade953874bc0d8513f5bc8671eef39022a61826c2252746704b5a6a72384eb35856200279bfdca68f82fa78a3b2a45d97cbe3baf3')
b2sums=('f5e5ad1e7410e2172bd5bd145cbf060449e09993a6ef555473442e49c5f38101d9d90ccc34c568db3877af87558158a2489925610c2373d0da5586f4119b13f5')

prepare() {
  md5sum -c <<< "c9554af7e3017208f455e7e468f7146e ${pkgname%-bin}-$pkgver.tar.gz"
}

package() {
  install -vd "$pkgdir"/opt/${pkgname%-bin}
  tar -xzf ${pkgname%-bin}-$pkgver.tar.gz \
    --no-same-owner \
    --strip-components=1 \
    --exclude=".config" \
    --exclude=".portable_mode" \
    -C "$pkgdir"/opt/${pkgname%-bin}
}
