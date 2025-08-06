# Maintainer: Amolith <amolith@secluded.site>
# Contributor: Aliaksiej Homza <aliaksiej.homza@gmail.com>
# Contributor: Wesley Moore <wes@wezm.net>
# Contributor: Matt C <matt@xhec.us>

pkgname=buckets-beta-bin
_pkgname=${pkgname%-bin}
pkgver=0.80.0
pkgrel=1
pkgdesc="Private budgeting with the envelope budgeting method"
arch=('x86_64')
url="https://www.budgetwithbuckets.com/"
license=('custom: commercial')
depends=('alsa-lib' 'gtk3' 'libsecret' 'libxss' 'libxtst' 'nss' 'glibc>=2.28-4')
optdepends=()
source=("https://github.com/buckets/desktop-beta/releases/download/v${pkgver}/Buckets-Beta-linux-latest-amd64-${pkgver}.deb")
noextract=("Buckets-Beta-linux-latest-amd64-${pkgver}.deb")
b2sums=('bf4591d2c0b998b051a9dd2c56407ba2f4a4be02e77c4d4981267633dc144b4e60ae584d5ea51d40d2cd03475691eb23b481ee32bcd2b4d3d4039fba4885ba81')

package() {
  bsdtar -O -xf "Buckets-Beta-linux-latest-amd64-${pkgver}.deb" data.tar.xz | bsdtar -C "${pkgdir}" -xJf -

  install -d "${pkgdir}/usr/bin"

  # Remove unnecessary stuff
  rm -rf "${pkgdir}/usr/share/doc"
}
