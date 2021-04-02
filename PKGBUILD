# Maintainer: Brad Erhart <tocusso underscore malty at aleeas dot com>

pkgname=kubectl-support-bundle-bin
_pkgname="${pkgname%-bin}"
_pkgname2="${_pkgname#kubectl-}"
pkgver=0.10.15
pkgrel=1
pkgdesc='Kubectl plugin for post-installation troubleshooting and diagnostics (support bundles)'
arch=('x86_64')
_goos='linux'
_goarch='amd64'
url="https://troubleshoot.sh"
license=('Apache')
depends=('kubectl')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("${_pkgname2}_${pkgver}_${_goos}_${_goarch}.tar.gz::https://github.com/replicatedhq/troubleshoot/releases/download/v$pkgver/${_pkgname2}_${_goos}_${_goarch}.tar.gz")
sha256sums=(95b86f9079e77b7e9648b66d2d0b8196e9b2838c585cf167982ee0f7c04afaec)

package() {
	install -Dm 755 "${_pkgname2}" "$pkgdir/usr/bin/kubectl-${_pkgname2/-/_}"
}
