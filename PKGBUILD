# Maintainer: Markus Maiwald <markus@maiwald.work>
pkgname=sober-bin
_upstream_version=0.7.3
pkgver="${_upstream_version//-/_}"
pkgrel=5
pkgdesc='Prevent AI-Slop: The Sober Raccoon is your local CodeRabbit: A Local-first repository governance assistant and code reviewer with deterministic review readiness'
arch=('x86_64')
# Marketing / product site (read about Sober). Source + releases: git.sovereign-society.org/Sober/sober
url='https://sober-dev.pages.dev'
license=('LSL-1.0')
depends=('tree-sitter')
provides=('sober')
conflicts=('sober')
# Pin ONLY the binary. Do not list SHA256SUMS as a source: that file is
# rewritten whenever extra release assets (OCI images, etc.) are attached,
# which breaks AUR integrity checks even when the binary is unchanged.
source=("https://git.sovereign-society.org/Sober/sober/releases/download/v${_upstream_version}/sober_v${_upstream_version}_linux_amd64")
sha256sums=('84da51b8e1dcda611c409cbbfbc7b466a5c42d214964c7c90192d07730a59199')

package() {
    install -Dm755 "${srcdir}/sober_v${_upstream_version}_linux_amd64" "${pkgdir}/usr/bin/sober"
}
