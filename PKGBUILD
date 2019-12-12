# Maintainer: TJ Hoplock <t.hoplock at gmail dot com>
pkgname=tmuxer-git
pkgver=2.0.0
pkgrel=1
pkgdesc="Tmux layout generator and command executor"
arch=('any')
url="https://github.com/tjhop/tmuxer"
license=('MIT')
depends=('bash' 'coreutils' 'sed' 'tmux')
makedepends=('git')
optdepends=('openssh')
provides=('tmuxer')
source=("$pkgname::git+https://github.com/tjhop/${pkgname%-*}.git")
md5sums=('SKIP')

pkgver() {
    cd "$pkgname"
    git describe --tags | sed 's/^v//g'
}

package() {
    cd "$pkgname"
    install -Dm644 ./LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm755 ./tmuxer "$pkgdir/usr/bin/tmuxer"
}
