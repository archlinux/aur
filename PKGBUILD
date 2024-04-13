# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Your Name <youremail@domain.com>
pkgname=nrdiag-bin
_pkg=nrdiag
pkgver=3.2.6
pkgrel=1
pkgdesc="New Relic Diagnostics CLI tool"
arch=(x86_64 aarch64)
url=""
license=('Apache')
groups=(newrelic)
depends=()
makedepends=()
checkdepends=()
optdepends=()
provides=(nrdiag)
conflicts=(nrdiag)
replaces=()
backup=()
options=()
install=
changelog=
source_x86_64=("https://download.newrelic.com/${_pkg}/${_pkg}_${pkgver}_Linux_x64.tar.gz")
source_aarch64=("https://download.newrelic.com/${_pkg}/${_pkg}_${pkgver}_Linux_arm64.tar.gz")

build () {
    mv ${srcdir}/nrdiag{_x64,}
}

package() {
    install -Dm u=rwx,go=rx -o root -g root -t ${pkgdir}/usr/bin ${srcdir}/nrdiag
}
sha256sums_x86_64=('a3aa9b5c366eaa9dc8e6c8d63c577049d44cd41353c80009488134b139284133')
sha256sums_aarch64=('4f5f17329ed358c29602c6120de84d7986abb84fdb63407615804853337dd2cf')
