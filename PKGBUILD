# Maintainer: Adam Chovanec <git@adamchovanec.cz>
# Ex-Maintainer: Varakh <varakh@varakh.de>
# Ex-Maintainer: Ray Del Rosario <michael@raydelrosario.com>
pkgname='grype-bin'
pkgver=0.101.0
pkgrel=1
pkgdesc='A vulnerability scanner for container images and filesystems.'
url='https://github.com/anchore/grype'
arch=('x86_64')
license=('Apache-2.0')
source=("https://github.com/anchore/grype/releases/download/v${pkgver}/grype_${pkgver}_linux_amd64.tar.gz")
sha256sums=('978ac92acef9ce49ae379a1f52cfa38e98c8227186f1a0de40936dc15d5d3d45')
package() {
  "$srcdir/grype" completion zsh > "$srcdir/zsh_grype"
  "$srcdir/grype" completion fish > "${srcdir}/fish_grype"
  "$srcdir/grype" completion bash > "$srcdir/bash_grype"

  install -D -m 0755 "$srcdir/grype" "${pkgdir}/usr/bin/grype"
  install -D -m 0644 "$srcdir/zsh_grype" "$pkgdir/usr/share/zsh/site-functions/_grype"
  install -D -m 0644 "${srcdir}/fish_grype" "${pkgdir}/usr/share/fish/completions/grype.fish"
  install -D -m 0644 "$srcdir/bash_grype" "$pkgdir/usr/share/bash-completion/completions/grype"
}
