# Maintainer: Brad Erhart <tocusso underscore malty at aleeas dot com>

pkgname=kubectl-support-bundle-bin
_pkgname="${pkgname%-bin}"
_pkgname2="${_pkgname#kubectl-}"
pkgver=0.22.1
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
b2sums=(7648a5cb2a18541268efd4341b4ec5086257bde8962c5809be5ed405e92e4222d71168bcf626f3469e9a41f0131ea9da608fa7a08d696a1da519247b227a8401)

package() {
	install -Dm 755 "${_pkgname2}" "$pkgdir/usr/bin/kubectl-${_pkgname2/-/_}"
}
