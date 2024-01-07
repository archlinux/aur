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
  "da046d7c56c3af0ff1d9e38c9ba9fff77b066fe46412c6d985b1196c7b15685f"
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
