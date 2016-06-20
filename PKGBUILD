# Maintainer: Hexchain Tong <i@hexchain.org>
pkgname=git-credential-gnome-keyring
pkgver=2.9.0
pkgrel=1
pkgdesc="Git credential helper using GNOME Keyring"
arch=(i686 x86_64)
url="https://github.com/git/git/tree/master/contrib/credential/gnome-keyring"
license=('GPL')
depends=('git' 'libgnome-keyring')
makedepends=('git')

pkgver() {
    git --version | cut -d' ' -f3
}

prepare() {
    cd "$srcdir"
    mkdir -p "$pkgname"
    cd "$pkgname"
    cp -vr /usr/share/git/credential/gnome-keyring/. .
}

build() {
    cd "$pkgname"
    make
}

package() {
    cd "$pkgname"
    install -Dm755 git-credential-gnome-keyring -t "$pkgdir/usr/bin"
}
