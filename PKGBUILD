# Maintainer: Stefan Cocora <stefan dot cocora at gmail dot com>
# Maintainer: Ian Emnace <igemnace at gmail dot com>
# Contributor: Darren Wu <$(base64 --decode <<<'ZGFycmVuMTk5NzA4MTBAZ21haWwuY29tCg==')>
# Contributor: rosatolen <rosatolen at gmail dot com>
# Contributor: Alex Peltzer ("alexpe87") <alexpe dot aur at mailbox dot org>

_pkgauthor=CircleCI-Public
_upstream_pkgname=circleci-cli
_upstream_elfname=circleci
pkgname=circleci-cli-bin
pkgver=1.0.50757
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
  "a61804b32313e724d99485076840f57259242ca12182dfa12d1d6f324310a785"
  SKIP
)

package() {
  install -Dm755 "${srcdir}/${_upstream_elfname}" "${pkgdir}/usr/bin/${_upstream_elfname}"
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${_upstream_pkgname}/LICENSE"
}
