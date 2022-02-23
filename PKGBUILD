# Maintainer: Thomas Ellison <thomasjlsn@gmail.com>
pkgname=pw
pkgver=1.3
pkgrel=1
pkgdesc="A simple password manager"
arch=(any)
url="https://gitlab.com/thomasjlsn/pw"
license=('GPL3')
depends=(bash gnupg tree)
makedepends=(git make)
optdepends=("qrencode: encoding passwords as qr codes")
provides=(pw)
conflicts=(pw-git)
source=("https://gitlab.com/thomasjlsn/pw/-/archive/1.3/pw-1.3.tar.gz")
md5sums=("SKIP")

package() {
    cd "pw-$pkgver"
    install -Dm755 pw.sh "$pkgdir/usr/bin/pw"
    install -Dm644 pw.1  "$pkgdir/usr/share/man/man1/pw.1"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/pw/LICENSE"
    install -Dm644 completion/bash_completion "$pkgdir/usr/share/bash-completion/completions/_pw"
    install -Dm644 completion/zsh_completion "$pkgdir/usr/share/zsh/site-functions/_pw"
}
