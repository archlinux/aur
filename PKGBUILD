# Maintainer: Stefan Wimmer <info@stefanwimmer128.xyz>

pkgname='zellij-selector'
pkgver='2.6.1'
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
source=("https://gitlab.com/stefanwimmer128/zellij-selector/-/releases/v$pkgver/downloads/zellij-selector-v$pkgver.tar.zst")
sha256sums=('SKIP')

build() {
    cd "$pkgname-v$pkgver"

    ./configure --prefix=/usr
    make
}

check() {
    cd "$pkgname-v$pkgver"

    make check
}

package() {
    cd "$pkgname-v$pkgver"

    make DESTDIR="$pkgdir" install
}
