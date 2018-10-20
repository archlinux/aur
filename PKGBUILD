# Maintainer: Germain Z. <https://github.com/GermainZ>
pkgname=aur-talk-git
_gitname=aur-talk
pkgver=r10.8fcf558
pkgrel=1
pkgdesc="A script to fetch and display AUR package comments"
arch=('any')
url="https://github.com/GermainZ/aur-talk"
license=('custom:ISC')
depends=('python-lxml' 'python-html2text')
makedepends=('git')
provides=('aur-talk')
conflicts=('aur-talk')
source=('git://github.com/GermainZ/aur-talk.git')
sha256sums=('SKIP') 

pkgver() {
    cd $_gitname
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd $_gitname
    install -Dm755 aur_talk.py "$pkgdir/usr/bin/aur-talk"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
