# Maintainer: stefanwimmer128 <info at stefanwimmer128 dot eu>

pkgname='zellij-selector'
pkgver='1.2.2'
pkgrel='1'
pkgdesc='Select zellij session'
arch=('any')
url='https://git.stefanwimmer128.eu/stefanwimmer128/zellij-selector'
license=('MPL2')
depends=('sh' 'libnewt' 'zellij')
makedepends=('make' 'git' 'shellcheck')
optdepends=('fish: Option to option fish shell'
            'zsh: Option to open zsh shell'
            'bash: Option to open bash shell')
source=("$pkgname::git+https://git.stefanwimmer128.eu/stefanwimmer128/zellij-selector.git#tag=v$pkgver")
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

    make DESTDIR="$pkgdir" install
}
