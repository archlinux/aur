# Maintainer: Karol Babioch <karol@babioch.de

pkgname=getssl-git
pkgver=1.0.r78.3753402
pkgrel=2
pkgdesc='Obtain SSL certificates from the letsencrypt.org ACME server. Suitable for automating the process on remote servers.'
arch=('any')
url='https://github.com/srvrco/getssl'
license=('GPL2')
depends=('openssl' 'curl' 'bind-tools')
makedepends=('git')
provides=('getssl-git')
conflicts=('getssl-git')
source=("$pkgname::git+https://github.com/srvrco/getssl.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/$pkgname"
    git describe --long --tags | sed 's/^v//;s/\([^-]*-\)g/r\1/;s/-/./g'
}

package() {
    cd "$srcdir/$pkgname"
    install -Dm755 getssl "$pkgdir/usr/bin/getssl"
}

