# Maintainer: Pellegrino Prevete <cGVsbGVncmlub3ByZXZldGVAZ21haWwuY29tCg== | base -d>
# Maintainer: Truocolo <truocolo@aol.com>

_git=false
_py="python"
_pkg="pgpgram"
_Pkg="PGPgram"
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
  "${_py}-setuptools"
)
[[ "${_git}" == true ]] && \
  makedepends+=(
    'git'
  )
provides=(
  "${_pkgname}=${pkgver}"
)
source=()
sha256sums=()
[[ "${_git}" == true ]] && \
  source+=(
    "${_pkg}-${pkgver}::git+${url}.git#tag=${pkgver}"
  ) && \
  sha256sums+=(
    'SKIP'
  )
[[ "${_git}" == false ]] && \
  source+=(
    "${_pkg}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz"
  ) && \
  sha256sums+=(
    "da046d7c56c3af0ff1d9e38c9ba9fff77b066fe46412c6d985b1196c7b15685f"
  )

package() {
  cd \
    "${_Pkg}-${pkgver}"
  "${_py}" \
    setup.py \
      install \
      --root="${pkgdir}" \
      --optimize=1
}

# vim: ts=2 sw=2 et:
