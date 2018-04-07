_pkgbase=BeautifulDiscord
pkgname=beautiful-discord-git
pkgdesc="Adds custom CSS support to Discord"
pkgver=43.ec03601
pkgrel=1
license=('MIT')
arch=('any')
url="https://github.com/leovoel/BeautifulDiscord"
depends=('python' 'python-psutil')
makedepends=('python-setuptools')
source=("git+https://github.com/leovoel/BeautifulDiscord.git")
sha1sums=('SKIP')

pkgver() {
    cd "$srcdir/$_pkgbase"
    echo "$(git rev-list HEAD --count).$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/$_pkgbase"
    python setup.py build
}

package() {
    cd "$srcdir/$_pkgbase"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
