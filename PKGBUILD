# Maintainer: Hiago Prata <hcprata17 at gmail dot com>

pkgname=pachctl-bin
pkgver=1.6.8
pkgrel=1
pkgdesc="Pachyderm lets you deploy and manage multi-stage, language-agnostic data pipelines while maintaining complete reproducibility and provenance."
url='pachyderm.io'
license=('Apache License 2.0')
depends=('minikube')
provides=('pachctl')
arch=('x86_64')
source_x86_64=("https://github.com/pachyderm/pachyderm/releases/download/v${pkgver}/pachctl_${pkgver}_amd64.deb")
sha256sums_x86_64=('ef892b58af60e5a4d353a603c83442b9ceb309c0010b3994a91d002eb3cee2d8')

prepare() {
	tar xvfz $srcdir/data.tar.gz
}

package() {
	install -D -m 755 "$srcdir/usr/bin/pachctl" "$pkgdir/usr/bin/pachctl"
}
