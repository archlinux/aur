# Maintainer: Nelson Estevão <nelsonmestevao@proton.me>

pkgname="livebook"
pkgver="0.9.2"
pkgrel="1"
pkgdesc="Automate code & data workflows with interactive Elixir notebooks"
url="https://livebook.dev"
license=("Apache-2.0")
arch=("x86_64")
depends=("elixir" "erlang-nox")
makedepends=('git' 'rebar3')

# sha256sums=("SKIP")

build() {
    /usr/bin/mix local.hex --force
    /usr/bin/mix local.rebar --force

    /usr/bin/mix escript.install hex livebook "$pkgver"
}

check() {
    /usr/bin/livebook --version
}

package() {
    # Copy the installed package to the package directory
    sudo cp -r $HOME/.mix/escripts/livebook /usr/bin/
}


