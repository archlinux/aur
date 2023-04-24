# Maintainer: Nelson Estevão <nelsonmestevao@proton.me>

pkgname="livebook"
pkgver="0.9.2"
pkgrel="1"
pkgdesc="Automate code & data workflows with interactive Elixir notebooks"
arch=("x86_64")
url="https://livebook.dev"

depends=('openssl'  'erlang'  'elixir')

# sha256sums=("SKIP")

build() {
    /usr/bin/mix do local.rebar --force, local.hex --force
    /usr/bin/mix escript.install hex livebook 0.7.2
}

check() {
    /usr/bin/livebook --version
}

package() {
    # Copy the installed package to the package directory
    sudo cp -r $HOME/.mix/escripts/livebook /usr/bin/
}


