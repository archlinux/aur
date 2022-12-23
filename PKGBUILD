# Maintainer: stefanwimmer128 <info at stefanwimmer128 dot eu>

pkgname='zellij-selector'
pkgver='1.2.1'
pkgrel='1'
pkgdesc='Select zellij session'
arch=('any')
url='https://git.stefanwimmer128.eu/stefanwimmer128/zellij-selector'
license=('MPL2')
depends=('sh' 'libnewt' 'zellij')
makedepends=('make' 'git')
optdepends=('fish: Option to option fish shell'
            'zsh: Option to open zsh shell'
            'bash: Option to open bash shell')
source=("$pkgname::git+https://git.stefanwimmer128.eu/stefanwimmer128/zellij-selector.git#tag=v1.2.1")
sha256sums=('SKIP')

build() {
    cd "$pkgname"

    make
}

package() {
    cd "$pkgname"

    make DESTDIR="$pkgdir" install
}
