# Maintainer: Amolith <amolith@secluded.site>
# Contributor: Aliaksiej Homza <aliaksiej.homza@gmail.com>
# Contributor: Wesley Moore <wes@wezm.net>
# Contributor: Matt C <matt@xhec.us>

pkgname=buckets-beta-bin
_pkgname=${pkgname%-bin}
pkgver=0.74.0
pkgrel=1
pkgdesc="Private budgeting with the envelope budgeting method"
arch=('x86_64')
url="https://www.budgetwithbuckets.com/"
license=('custom: commercial')
depends=('alsa-lib' 'gtk3' 'libsecret' 'libxss' 'libxtst' 'nss' 'glibc>=2.28-4')
optdepends=()
source=("https://github.com/buckets/desktop-beta/releases/download/v${pkgver}/Buckets-Beta-linux-latest-amd64-${pkgver}.deb")
noextract=("Buckets-Beta-linux-latest-amd64-${pkgver}.deb")
b2sums=('93dbdedc2a75c160939673ace81e3c4fc85dfa6f88d0c97fbf9ace85c9c775df7f6661dd46eb058255849f902dd258c4d4e9286ac2d6dbbe07b6f87163bce59f')

package() {
  bsdtar -O -xf "Buckets-Beta-linux-latest-amd64-${pkgver}.deb" data.tar.xz | bsdtar -C "${pkgdir}" -xJf -

  install -d "${pkgdir}/usr/bin"

  # Remove unnecessary stuff
  rm -rf "${pkgdir}/usr/share/doc"
}

