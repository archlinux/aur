# Maintainer: AlphaLynx <AlphaLynx at protonmail dot com>

pkgname=pyactivate-git
_name=${pkgname%-git}
pkgver=1.2.0.r1.gb2972a0
pkgrel=1
pkgdesc='Add a python venv to your environment from within subdirs in a project'
arch=('any')
url="https://github.com/AlphaLynx0/$_name"
license=('MIT')
depends=('bash')
makedepends=('git')
install=instructions.install
source=("git+$url")
sha256sums=('SKIP')

pkgver() {
    cd $_name
    git describe --long --tags --abbrev=7 | sed 's/^v//;s/-/.r/;s/-/./g'
}

package() {
    cd $_name
    install -Dm644 $_name.sh "$pkgdir/usr/share/$_name/$_name.sh"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
