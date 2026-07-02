pkgname=magnolia
pkgver=2.2.3
pkgrel=1
pkgdesc="Torrent streaming client for PCs"
arch=('x86_64')
url="https://github.com/chwair/magnolia"
license=('MIT')
depends=(
  'webkit2gtk-4.1'
  'gtk3'
  'openssl'
  'fontconfig'
  'freetype2'
  'harfbuzz'
  'libpng'
  'libjpeg-turbo'
  'libwebp'
  'brotli'
  'bzip2'
  'expat'
  'pcre2'
  'zstd'
  'xz'
  'lz4'
  'libthai'
  'gcc-libs'
)
optdepends=(
  'libva: hardware video decode (VA-API)'
)
options=('!strip' '!debug')
source=("${pkgname}-${pkgver}.deb::${url}/releases/download/v${pkgver}/Magnolia_${pkgver}_amd64.deb")
sha256sums=('6091df8352dd01514cac3227402b5052be5a356304d3e4a31515a164f07054a6')
noextract=("${pkgname}-${pkgver}.deb")

package() {
  bsdtar -xOf "${srcdir}/${pkgname}-${pkgver}.deb" 'data.tar*' | bsdtar -xf - -C "$pkgdir"

  chmod -R go-w "$pkgdir"
}
