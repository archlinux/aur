# Maintainer: Adam Chovanec <git@adamchovanec.cz>
# Ex-Maintainer: Varakh <varakh@varakh.de>
# Ex-Maintainer: Ray Del Rosario <michael@raydelrosario.com>
pkgname='grype-bin'
pkgver=0.104.1
pkgrel=1
pkgdesc='A vulnerability scanner for container images and filesystems.'
url='https://github.com/anchore/grype'
arch=('x86_64')
license=('Apache-2.0')
source=("https://github.com/anchore/grype/releases/download/v${pkgver}/grype_${pkgver}_linux_amd64.tar.gz")
sha256sums=('2cb820b6c81f88fd6aff3fb4ca5a7161e9ab70af0f27fc5e99cd16deb987cd5f')
package() {
  "$srcdir/grype" completion zsh > "$srcdir/zsh_grype"
  "$srcdir/grype" completion fish > "${srcdir}/fish_grype"
  "$srcdir/grype" completion bash > "$srcdir/bash_grype"

  install -D -m 0755 "$srcdir/grype" "${pkgdir}/usr/bin/grype"
  install -D -m 0644 "$srcdir/zsh_grype" "$pkgdir/usr/share/zsh/site-functions/_grype"
  install -D -m 0644 "${srcdir}/fish_grype" "${pkgdir}/usr/share/fish/completions/grype.fish"
  install -D -m 0644 "$srcdir/bash_grype" "$pkgdir/usr/share/bash-completion/completions/grype"
}
