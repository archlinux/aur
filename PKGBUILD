# Maintainer: Hiago Prata <hcprata17 at gmail dot com>

pkgname=pachctl-bin
pkgver=1.6.0
pkgrel=1
pkgdes="Pachyderm lets you deploy and manage multi-stage, language-agnostic data pipelines while maintaining complete reproducibility and provenance."
url='pachyderm.io'
license=('Apache License 2.0')
provides=('pachctl')
arch=('x86_64')
source_x86_64=("https://github.com/pachyderm/pachyderm/releases/download/v${pkgver}/pachctl_${pkgver}_amd64.deb")
md5sums_x86_64=('ad6b943424365f5eb509615165290eed')
sha256sums_x86_64=('4289190e740b45f11291633aee15a3137e07f02905e2604772d0f29e93ac63cf')

prepare() {
	tar xvfz $srcdir/data.tar.gz
}

package() {
	install -D -m 755 "$srcdir/usr/bin/pachctl" "$pkgdir/usr/bin/pachctl"
}
