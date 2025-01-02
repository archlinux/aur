# Maintainer: Amolith <amolith@secluded.site>
# Contributor: Aliaksiej Homza <aliaksiej.homza@gmail.com>
# Contributor: Wesley Moore <wes@wezm.net>
# Contributor: Matt C <matt@xhec.us>

pkgname=buckets-beta-bin
_pkgname=${pkgname%-bin}
pkgver=0.78.0
pkgrel=1
pkgdesc="Private budgeting with the envelope budgeting method"
arch=('x86_64')
url="https://www.budgetwithbuckets.com/"
license=('custom: commercial')
depends=('alsa-lib' 'gtk3' 'libsecret' 'libxss' 'libxtst' 'nss' 'glibc>=2.28-4')
optdepends=()
source=("https://github.com/buckets/desktop-beta/releases/download/v${pkgver}/Buckets-Beta-linux-latest-amd64-${pkgver}.deb")
noextract=("Buckets-Beta-linux-latest-amd64-${pkgver}.deb")
b2sums=('6ce26e8b56a0cfe356895d794a0690483bd7250dfe85645556dd0c0ca57d990327dbcacc7b2f04ca0271a3aa134e330d64a5bab6fbdd62d6eae43691b24fd7f1')

package() {
  bsdtar -O -xf "Buckets-Beta-linux-latest-amd64-${pkgver}.deb" data.tar.xz | bsdtar -C "${pkgdir}" -xJf -

  install -d "${pkgdir}/usr/bin"

  # Remove unnecessary stuff
  rm -rf "${pkgdir}/usr/share/doc"
}
