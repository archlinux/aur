# Maintainer: Brad Erhart <tocusso underscore malty at aleeas dot com>

pkgname=kubectl-support-bundle-bin
_pkgname="${pkgname%-bin}"
_pkgname2="${_pkgname#kubectl-}"
pkgver=0.11.0
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
b2sums=(47825fb3005cefe9362442943eb5de457f0b0fa1264f62d9a173f86e51a80690270a6992ca08bd0196c2a3a9527c76df725de9175ffc488d39ab3e4708c1447b)

package() {
	install -Dm 755 "${_pkgname2}" "$pkgdir/usr/bin/kubectl-${_pkgname2/-/_}"
}
