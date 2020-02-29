# Maintainer: KokaKiwi <kokakiwi@kokakiwi.net>
pkgname=elixir-ls
pkgver=0.3.0
pkgrel=1
pkgdesc='A frontend-independent Language Server Protocol for Elixir'
arch=('any')
url='https://github.com/elixir-lsp/elixir-ls'
depends=('elixir>=1.7.0' 'erlang-nox>=20.0')
source=("https://github.com/elixir-lsp/elixir-ls/releases/download/v${pkgver}/elixir-ls.zip")
sha256sums=('ab21b131bd203a6b461ad77f8177ee0000981920f6b86e2319fde70320b52d60')

package() {
    install -Dm0644 -t "${pkgdir}"/usr/lib/elixir-ls *.ez
    install -Dm0755 -t "${pkgdir}"/usr/lib/elixir-ls *.sh

    install -dm0755 "${pkgdir}"/usr/bin
    ln -sf /usr/lib/elixir-ls/language_server.sh "${pkgdir}"/usr/bin/elixir-ls
    ln -sf /usr/lib/elixir-ls/debugger.sh "${pkgdir}"/usr/bin/elixir-ls-debugger
}
