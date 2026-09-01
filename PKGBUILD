# Maintainer: Stefan Cocora <stefan dot cocora at gmail dot com>
# Maintainer: Ian Emnace <igemnace at gmail dot com>
# Contributor: Darren Wu <$(base64 --decode <<<'ZGFycmVuMTk5NzA4MTBAZ21haWwuY29tCg==')>
# Contributor: rosatolen <rosatolen at gmail dot com>
# Contributor: Alex Peltzer ("alexpe87") <alexpe dot aur at mailbox dot org>

_pkgauthor=CircleCI-Public
_upstream_pkgname=circleci-cli
_upstream_elfname=circleci
pkgname=circleci-cli-bin
pkgver=1.0.49092
pkgrel=1
pkgdesc="CircleCI's new command-line application."
arch=('x86_64')
_goos="linux"
_goarch="amd64"
provides=(circleci-cli)
conflicts=(circleci-cli)
url="https://github.com/${_pkgauthor}/${_upstream_pkgname}"
license=("MIT")
### https://github.com/CircleCI-Public/circleci-cli/releases/download/v0.1.4427/circleci-cli_0.1.4427_linux_amd64.tar.gz
source=("${_upstream_pkgname}-${pkgver}.tar.gz::https://github.com/${_pkgauthor}/${_upstream_pkgname}/releases/download/v${pkgver}/${_upstream_pkgname}_${pkgver}_${_goos}_${_goarch}.tar.gz"
  "LICENSE::https://raw.githubusercontent.com/${_pkgauthor}/${_upstream_pkgname}/refs/tags/v${pkgver}/LICENSE")
sha256sums=(
  "7e4f74984db8fd52a04becaf465514de631c57ceba211228d7031b0282f6ac6e"
  "08298012af72d8dba26569c199dd71d344ce1d39029363cf8bf0c6c7a08a5f70"
)

package() {
  install -Dm755 "${srcdir}/${_upstream_elfname}" "${pkgdir}/usr/bin/${_upstream_elfname}"
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${_upstream_pkgname}/LICENSE"
}
