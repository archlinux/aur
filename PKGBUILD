pkgname=passer-git
pkgver=20250908.r42.gabcd123  # Will be set by pkgver()
pkgrel=1
pkgdesc="passer is a password generator based on passphrases"
arch=(any)
url="https://github.com/spynetS/passer"
license=(GPL3)
depends=(python xclip python-pyperclip python-passlib python-flagser)
source=("git+https://github.com/spynetS/passer.git")
md5sums=(SKIP)

pkgver() {
    cd "$srcdir/passer"
    git rev-parse --short HEAD
}

package() {
    cd "$srcdir/passer"
    install -Dm755 ./passer.py "$pkgdir/usr/bin/passer"
}
