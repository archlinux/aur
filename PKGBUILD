# Maintainer: Brad Erhart <tocusso underscore malty at aleeas dot com>

pkgname=kubectl-support-bundle-bin
_pkgname="${pkgname%-bin}"
_pkgname2="${_pkgname#kubectl-}"
pkgver=0.13.16
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
b2sums=(3a02d20b28e4d2b04bb95b5c61d992220369ba78d15ace9d23158c7b4e62d2bcb1dc08a7888be5cb53e32450dfef196974c7932a32adbbeec25acb4ab54a4067)

package() {
	install -Dm 755 "${_pkgname2}" "$pkgdir/usr/bin/kubectl-${_pkgname2/-/_}"
}
