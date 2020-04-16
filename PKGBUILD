# Maintainer: Jeremy Kescher <jeremy@kescher.at>

pkgname=eternalterminal-bash-completion
pkgdesc="Bash completion for eternalterminal"
pkgver=r3.65cb401
pkgrel=1
arch=("any")
url="https://github.com/kescherCode/eternalterminal-bash-completion"
license=("Apache")
makedepends=('git')
depends=("bash-completion")
optdepends=("eternalterminal: Needed if eternalterminal-client isn't installed"
            "eternalterminal-client: Needed if eternalterminal isn't installed")
source=('git+https://github.com/kescherCode/eternalterminal-bash-completion.git')
md5sums=('SKIP')

pkgver() {
    cd "$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "$pkgname"
    for file in * ; do
    install -Dm644 $file "$pkgdir/usr/share/bash-completion/completions/$file"
    done
}
