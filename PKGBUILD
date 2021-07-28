# Maintainer: Brad Erhart <tocusso underscore malty at aleeas dot com>

pkgname=kubectl-support-bundle-bin
_pkgname="${pkgname%-bin}"
_pkgname2="${_pkgname#kubectl-}"
pkgver=0.13.6
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
b2sums=(5f18e05831be5aa8330d8594c1b213d88082cb7652a7fd32d0d0f2723aba66a9a2f845ee01d0987a40cb7d5d31ecdb0ba49e4880e41d5a38c1c606b26b5b8d95)

package() {
	install -Dm 755 "${_pkgname2}" "$pkgdir/usr/bin/kubectl-${_pkgname2/-/_}"
}
