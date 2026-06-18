# Maintainer: Mitchel Humpherys <mitch.special@gmail.com>
pkgname=aur-sleuth-git
pkgver=r109.4766156
pkgrel=1
pkgdesc='LLM-powered security auditor for AUR packages'
arch=('any')
url='https://github.com/mgalgs/aur-sleuth'
license=('MIT')
depends=('uv' 'git' 'pacman')
optdepends=('cabextract: support for packages that use cabinet archives')
makedepends=('git')
provides=('aur-sleuth')
conflicts=('aur-sleuth')
source=('git+https://github.com/mgalgs/aur-sleuth.git'
        'aur-sleuth.conf'
        'LICENSE')
sha256sums=('SKIP'
            'SKIP'
            'SKIP')
backup=('etc/aur-sleuth.conf')

pkgver() {
    cd aur-sleuth
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    install -Dm755 aur-sleuth/aur-sleuth "$pkgdir/usr/bin/aur-sleuth"
    install -Dm644 aur-sleuth.conf "$pkgdir/etc/aur-sleuth.conf"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
