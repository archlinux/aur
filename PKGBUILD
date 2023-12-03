# Maintainer: stefanwimmer128 <info at stefanwimmer128 dot xyz>

pkgname='zellij-selector'
pkgver='2.4.1'
pkgrel='2'
pkgdesc='Select zellij session'
arch=('any')
url='https://codeberg.org/stefanwimmer128/zellij-selector'
license=('MPL2')
depends=('sh' 'libnewt' 'zellij' 'jq.sh' 'yq')
makedepends=('git' 'shellcheck' 'getoptions' 'cross-install')
optdepends=('fish: Option to option fish shell'
            'zsh: Option to open zsh shell'
            'bash: Option to open bash shell')
source=("$pkgname::git+https://codeberg.org/stefanwimmer128/zellij-selector.git#tag=v$pkgver")
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
