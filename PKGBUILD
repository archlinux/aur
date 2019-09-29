# Maintainer: Hexchain Tong <i@hexchain.org>
pkgname=git-credential-gnome-keyring
pkgver=2.23.0
pkgrel=1
pkgdesc="Git credential helper using GNOME Keyring"
arch=(i686 x86_64)
url="https://github.com/git/git/tree/master/contrib/credential/gnome-keyring"
license=('GPL')
depends=('git' 'libgnome-keyring')
makedepends=('git')
source=("https://www.kernel.org/pub/software/scm/git/git-$pkgver.tar.xz"
        "https://www.kernel.org/pub/software/scm/git/git-$pkgver.tar.sign")
validpgpkeys=('96E07AF25771955980DAD10020D04E5A713660A7') # Junio C Hamano

build() {
    cd "$srcdir/git-$pkgver/contrib/credential/gnome-keyring"
    make
}

package() {
    cd "$srcdir/git-$pkgver/contrib/credential/gnome-keyring"
    install -Dm755 git-credential-gnome-keyring -t "$pkgdir/usr/bin"
}
sha256sums=('234fa05b6839e92dc300b2dd78c92ec9c0c8d439f65e1d430a7034f60af16067'
            'SKIP')
