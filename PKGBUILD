pkgname=opensearch-cli-bin
pkgver=1.0.0
pkgrel=1
provides=('opensearch-cli')
pkgdesc='The OpenSearch command line interface (opensearch-cli) lets you manage your cluster from the command line and automate tasks.'
arch=('x86_64')
url='https://opensearch.org/'
license=('Apache License 2.0')
sha256sums=('83b4ff062318c5ee4334d575b98d10c368da2552572860140f4289d19fcf99b1')
source=("https://artifacts.opensearch.org/opensearch-clients/opensearch-cli/opensearch-cli-${pkgver}-linux-x64.zip")

package() {
  install -Dm 755 "${srcdir}/opensearch-cli" "${pkgdir}/usr/bin/opensearch-cli"

  # Populate bash and zsh completions
  install -dm 755 "${pkgdir}/usr/share/bash-completion/completions"
  install -dm 755 "${pkgdir}/usr/share/zsh/site-functions"
  "${pkgdir}/usr/bin/opensearch-cli" completion bash > "${pkgdir}/usr/share/bash-completion/completions/opensearch-cli"
  "${pkgdir}/usr/bin/opensearch-cli" completion zsh >  "${pkgdir}/usr/share/zsh/site-functions/_opensearch-cli"
}
