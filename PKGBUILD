# Maintainer: Hiago Prata <hcprata17 at gmail dot com>

pkgname=pachctl-bin
pkgver=1.6.10
pkgrel=2
pkgdesc="Pachyderm lets you deploy and manage multi-stage, language-agnostic data pipelines while maintaining complete reproducibility and provenance."
url='pachyderm.io'
license=('Apache License 2.0')
depends=('minikube-bin')
provides=('pachctl')
arch=('x86_64')
source_x86_64=("https://github.com/pachyderm/pachyderm/releases/download/v${pkgver}/pachctl_${pkgver}_amd64.deb")
sha256sums_x86_64=('71245501f0b4f3aad4dfa7b8034e4c2832c1ba703f53bad5cb7ddb9ce0c233f3')

prepare() {
	tar xvfz $srcdir/data.tar.gz
}

package() {
	install -D -m 755 "$srcdir/usr/bin/pachctl" "$pkgdir/usr/bin/pachctl"
}
