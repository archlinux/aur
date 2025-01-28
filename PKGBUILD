# Maintainer: Nebulosa  <nebulosa2007-at-yandex-dot-ru>

pkgname=orbitiny-desktop-bin
pkgver=0.0.1
pkgrel=2
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
sha512sums=('8a38cfa90c79e00e920ad11f3ffef679f17fd8469b2ce81f67e165e1fe3e975bc781b3de89e5af9d40523de827ec1d0bc3c6bd267ee52b0e3b7c916c75adefbb')
b2sums=('79b026b6b649304478816f70361ec593be3f460862f5bffa942ed02603579bd599170e142c79568565ed7ac3befb801b5fc33a886a2970e5e045289bcaa5719f')

prepare() {
  md5sum -c <<< "bce30f77bcdc42bdc9633095e4b97327 ${pkgname%-bin}-$pkgver.tar.gz"
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
