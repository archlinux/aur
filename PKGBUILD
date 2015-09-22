pkgname=urxvt-perls-git
pkgver=1.df7ead4
pkgrel=1
pkgdesc="URL and Mouseless text selection for rxvt-unicode"
arch=('any')
url='http://www.github.com/muennich/urxvt-perls'
license=('GPL2')
depends=('rxvt-unicode' 'perl' 'xsel')
provides=('urxvt-perls' 'urxvt-url-select' 'urxvt-keyboard-select')
conflicts=('urxvt-perls' 'urxvt-url-select' 'urxvt-keyboard-select')
replaces=('urxvt-perls' 'urxvt-url-select' 'urxvt-keyboard-select')
install=urxvt-perls.install
source=(git://github.com/muennich/urxvt-perls)
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/urxvt-perls"
    echo $(git rev-list --count master).$(git rev-parse --short master)
}

package() {
    cd "$srcdir/urxvt-perls"

    install -dm755 "$pkgdir"/usr/lib/urxvt/perl
    install -t "$pkgdir"/usr/lib/urxvt/perl -m644 url-select keyboard-select clipboard
}
