# Maintainer: OxiRoute maintainers <https://github.com/oxiroute/oxiroute/issues>

pkgname=oxiroute-bin
pkgver=0.5.0
pkgrel=1
pkgdesc='Pingora-based HTTP, TCP, and RTMP proxy runtime (prebuilt binary)'
arch=('x86_64')
url='https://github.com/brauliobo/oxiroute'
license=('Apache-2.0')
depends=('ca-certificates' 'gcc-libs' 'glibc' 'openssl')
optdepends=('certbot: provide certificate lineages consumed by configured Certbot sources')
provides=("oxiroute=${pkgver}")
conflicts=('oxiroute')
backup=('etc/oxiroute/oxiroute.env'
        'etc/oxiroute/oxiroute.kdl'
        'etc/oxiroute/oxiroute.lua')
install=oxiroute.install
options=('!strip')
_archive="oxiroute-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst"
source=("${_archive}::${url}/releases/download/v${pkgver}/${_archive}")
noextract=("${_archive}")
sha256sums=('837b79316d1d81c8faa1fdd1f7f5727e3e722d152983d27252c5a734bd37529c')

package() {
  bsdtar -xpf "${srcdir}/${_archive}" -C "${pkgdir}" \
    --exclude='.BUILDINFO' \
    --exclude='.INSTALL' \
    --exclude='.MTREE' \
    --exclude='.PKGINFO'
}
