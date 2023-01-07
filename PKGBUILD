# Maintainer: stefanwimmer128 <info at stefanwimmer128 dot eu>

pkgname='jq.sh'
pkgver='0.1.0'
pkgrel='1'
pkgdesc='jq-in-shell integration library'
arch=('any')
url='https://git.stefanwimmer128.eu/stefanwimmer128/jq.sh'
license=('MPL2')
depends=('sh' 'jq')
makedepends=('make' 'git' 'shellcheck' 'shellspec')
optdepends=('fish: Option to option fish shell'
            'zsh: Option to open zsh shell'
            'bash: Option to open bash shell')
source=("$pkgname::git+https://git.stefanwimmer128.eu/stefanwimmer128/jq.sh.git#tag=v$pkgver")
sha256sums=('SKIP')

check() {
    cd "$pkgname"

    make check
}

package() {
    cd "$pkgname"

    make DESTDIR="$pkgdir" install
}
