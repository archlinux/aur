# Maintainer: Pellegrino Prevete <cGVsbGVncmlub3ByZXZldGVAZ21haWwuY29tCg== | base -d>
# Maintainer: Truocolo <truocolo@aol.com>

_py="python"
_pkg="pgpgram"
pkgbase="${_pkg}"
_pkgname="${_py}-${_pkg}"
pkgname=(
  "${pkgbase}"
)
pkgver=0.4
pkgrel=1
pkgdesc='PGP encrypted backups on Telegram Cloud'
arch=(
  'any')
_http="https://github.com"
_ns="tallero"
url="${_http}/${_ns}/${_pkg}"
license=(
  'AGPL3')
depends=(
  "${_py}"
  "${_py}-appdirs"
  "${_py}-setproctitle"
  "${_py}-sqlitedict"
  'telegram-tdlib'
  'trovotutto'
)
optdepends=(
  'youtube-dl'
)
makedepends=(
  # git
  "${_py}-setuptools"
)
provides=(
  "${_pkgname}=${pkgver}"
)
source=(
  # "${_pkg}-${pkgver}::git+${url}.git#tag=${pkgver}"
  "${_pkg}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz"
)
sha256sums=(
  # 'SKIP'
  "9910017134149cc08d5958a148851033c33c2dbf0d599e7724404f9dc72996f95ec45947dcc7daec1d89614f9a50096c79044e06973fc5133a402e34f5605945"
)

package() {
  cd \
    "${_pkg}-${pkgver}"
  "${_py}" \
    setup.py \
      install \
      --root="${pkgdir}" \
      --optimize=1
}

# vim: ts=2 sw=2 et:
