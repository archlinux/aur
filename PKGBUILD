# Maintainer: Amolith <amolith@secluded.site>
# Contributor: Aliaksiej Homza <aliaksiej.homza@gmail.com>
# Contributor: Wesley Moore <wes@wezm.net>
# Contributor: Matt C <matt@xhec.us>

pkgname=buckets-beta-bin
_pkgname=${pkgname%-bin}
pkgver=0.77.0
pkgrel=1
pkgdesc="Private budgeting with the envelope budgeting method"
arch=('x86_64')
url="https://www.budgetwithbuckets.com/"
license=('custom: commercial')
depends=('alsa-lib' 'gtk3' 'libsecret' 'libxss' 'libxtst' 'nss' 'glibc>=2.28-4')
optdepends=()
source=("https://github.com/buckets/desktop-beta/releases/download/v${pkgver}/Buckets-Beta-linux-latest-amd64-${pkgver}.deb")
noextract=("Buckets-Beta-linux-latest-amd64-${pkgver}.deb")
b2sums=('8be0efa8905c168e55718d9c30653314587ad8387b7c41cffb408eb43fcf4f5574fd72fe0361ea8991b35947e3c99ade0e2c94468a8cebbd10435061f2296517')

package() {
  bsdtar -O -xf "Buckets-Beta-linux-latest-amd64-${pkgver}.deb" data.tar.xz | bsdtar -C "${pkgdir}" -xJf -

  install -d "${pkgdir}/usr/bin"

  # Remove unnecessary stuff
  rm -rf "${pkgdir}/usr/share/doc"
}
