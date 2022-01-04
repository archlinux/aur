# Maintainer: Torsten Henschel <to at h6l dot de>
# Contributor: Karol Babioch <karol at babioch dot de>

pkgname=getssl-git
pkgver=latest.r19.e4154c4
pkgrel=1
pkgdesc='Obtain SSL certificates from the letsencrypt.org ACME server. Suitable for automating the process on remote servers.'
arch=('any')
url='https://github.com/srvrco/getssl'
license=('GPL3')
depends=('openssl' 'curl' 'bind-tools')
makedepends=('git')
provides=('getssl-git')
conflicts=('getssl')
source=("$pkgname::git+https://github.com/srvrco/getssl.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/$pkgname"
    git describe --long --tags | sed 's/^v//;s/\([^-]*-\)g/r\1/;s/-/./g'
}

package() {
    cd "$srcdir/$pkgname"
    make DESTDIR="$pkgdir/" install
}
