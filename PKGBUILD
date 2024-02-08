# Maintainer: Amolith <amolith@secluded.site>
# Contributor: Aliaksiej Homza <aliaksiej.homza@gmail.com>
# Contributor: Wesley Moore <wes@wezm.net>
# Contributor: Matt C <matt@xhec.us>

pkgname=buckets-beta-bin
_pkgname=${pkgname%-bin}
pkgver=0.73.3
pkgrel=1
pkgdesc="Private budgeting with the envelope budgeting method"
arch=('x86_64')
url="https://www.budgetwithbuckets.com/"
license=('custom: commercial')
depends=('alsa-lib' 'gtk3' 'libsecret' 'libxss' 'libxtst' 'nss' 'glibc>=2.28-4')
optdepends=()
source=("https://github.com/buckets/desktop-beta/releases/download/v${pkgver}/Buckets-Beta-linux-latest-amd64-${pkgver}.deb")
noextract=("Buckets-Beta-linux-latest-amd64-${pkgver}.deb")
sha256sums=('b895bd2cad0a0efb38250b785701e1e8323b31ad49716bf25d87208610315e6f')

package() {
  bsdtar -O -xf "Buckets-Beta-linux-latest-amd64-${pkgver}.deb" data.tar.xz | bsdtar -C "${pkgdir}" -xJf -

  install -d "${pkgdir}/usr/bin"

  # Remove unnecessary stuff
  rm -rf "${pkgdir}/usr/share/doc"
}

