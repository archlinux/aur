# Maintainer: Your Name <your-email@example.com>
pkgname=nanoclaw-git
_pkgname=nanoclaw
pkgver=r181.226b520
pkgrel=1
pkgdesc="AI-Native personal assistant for WhatsApp/Telegram with container isolation"
arch=('any')
url="https://github.com/gavrielc/nanoclaw"
license=('MIT')
depends=('nodejs>=20' 'claude-code' 'docker' 'git')
makedepends=('git')
provides=('nanoclaw')
conflicts=('nanoclaw')
source=("git+https://github.com/gavrielc/nanoclaw.git"
        "nanoclaw.sh")
sha256sums=('SKIP'
            'SKIP')

pkgver() {
    cd "$_pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    install -d "$pkgdir/opt/$_pkgname"
    cp -ra "$_pkgname"/. "$pkgdir/opt/$_pkgname/"
    install -Dm755 "nanoclaw.sh" "$pkgdir/usr/bin/nanoclaw"
}
