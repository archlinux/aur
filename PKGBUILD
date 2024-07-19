# Maintainer: Stefan Wimmer <info@stefanwimmer128.xyz>

pkgname='zellij-selector'
pkgver='2.5.0'
pkgrel='1'
pkgdesc='Select zellij session'
arch=('any')
url='https://gitlab.com/stefanwimmer128/zellij-selector'
license=('MPL2')
depends=('sh' 'libnewt' 'zellij' 'jq.sh' 'yq')
makedepends=('git' 'shellcheck' 'getoptions' 'cross-install')
optdepends=('fish: Option to option fish shell'
            'zsh: Option to open zsh shell'
            'bash: Option to open bash shell')
source=("$pkgname::git+https://gitlab.com/stefanwimmer128/zellij-selector.git#tag=v$pkgver")
sha256sums=('SKIP')

build() {
    cd "$pkgname"

    make
}

check() {
    cd "$pkgname"

    make check
}

package() {
    cd "$pkgname"

    make DESTDIR="$pkgdir" PREFIX=/usr install
}
