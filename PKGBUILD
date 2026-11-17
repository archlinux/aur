# Maintainer: txtsd <aur.archlinux@ihavea.quest>
# Contributor: Sashanoraa <sasha@noraa.gay>

pkgname=yt-spammer-purge
pkgver=2.18.0
pkgrel=1
pkgdesc="A script that allows you to filter and search for spammer comments on your channel and other's channel(s)"
arch=(any)
url='https://github.com/ThioJoe/YT-Spammer-Purge'
license=('GPL-3.0-or-later')
depends=(
  bash
  python
  python-certifi
  python-colorama
  python-google-api-python-client
  python-google-auth
  python-google-auth-oauthlib
  python-levenshtein
  python-numpy
  python-protobuf
  python-rapidfuzz
  python-regex
  python-requests
  python-rtfunicode
  python-setuptools
  python-six
  python-urllib3
  tk
)
install=yt-spammer-purge.install
source=(
  "yt-spammer-purge-${pkgver}.tar.gz::https://github.com/ThioJoe/YT-Spammer-Purge/archive/refs/tags/v${pkgver}.tar.gz"
  yt-spammer-purge
)
sha256sums=('6ed80485efbcaaacf192d4bfa95f6d9f4fc3218746c607fd61406b80e7aed2f2'
            'f3f6ace0928d0c5465c693a4300e03059c33d4c059409741169f5c5e9e5eeb86')

package() {
  mkdir -p "${pkgdir}/usr/share"
  cp -r "YT-Spammer-Purge-${pkgver}" "${pkgdir}/usr/share/${pkgname}"
  chmod a+w "${pkgdir}/usr/share/${pkgname}"

  install -Dm755 yt-spammer-purge "${pkgdir}/usr/bin/yt-spammer-purge"
}
