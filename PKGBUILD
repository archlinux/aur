#Maintainer: Wilson E. Alvarez <wilson.e.alvarez@rubonnek.com>
_pkgname="forgejo-runner"
pkgname="${_pkgname}-bin"
pkgver=4.0.1
pkgrel=2
pkgdesc="Continuous integration for Forgejo"
arch=('x86_64' 'aarch64')
url="https://code.forgejo.org/forgejo/runner"
license=('MIT')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source_x86_64=("https://code.forgejo.org/forgejo/runner/releases/download/v${pkgver}/${_pkgname}-${pkgver}-linux-amd64")
sha256sums_x86_64=('45f513988b7136c1dc62316d9d635f0791fa0c5be7f6735560980988cf0c5c8a')
source_aarch64=("https://code.forgejo.org/forgejo/runner/releases/download/v${pkgver}/${_pkgname}-${pkgver}-linux-arm64")
sha256sums_aarch64=('5aa0373be455637826d6126e3911fe653f3c0538a9e84d97497ba3c416757fca')

package() {
	local bin_base="${_pkgname}-${pkgver}"
	local arch_base=""
	if [[ $CARCH == "x86_64" ]]; then
		arch_base="linux-amd64"
	else
		arch_base="linux-arm64"
	fi
	install -Dm755 "${bin_base}-${arch_base}" "$pkgdir/usr/bin/${_pkgname}"
}
