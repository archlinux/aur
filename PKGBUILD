# Maintainer: Fermín Olaiz <fermin@olaiz.net>

_pkgname='imap-upload'
pkgname="$_pkgname-git"
pkgver=r63.9578cb5
pkgrel=1
pkgdesc="Python script for uploading a local mbox file to IMAP4 server."
arch=('any')
url="https://github.com/rgladwell/imap-upload"
license=('MIT')
depends=('python>=3.5.0' 'python-imapclient')
makedepends=('git')
provides=("$_pkgname")
source=("git+$url.git#branch=master")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/$_pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

package() {
    cd "$srcdir/$_pkgname"
	install -Dm755 -t "$pkgdir/usr/bin/" imap_upload.py
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" License.txt
}
