pkgname='holo-ssh-keys'
pkgver=1.2
pkgrel=1
pkgdesc='Holo plugin for provisioning SSH public keys to $HOME/.ssh/authorized_keys'
arch=('i686' 'x86_64' 'armv7h')
url='http://holocm.org'
license=('GPL3')
depends=(
    'openssh'
    'HOLO_API_VERSION=3'
)
makedepends=('go' 'perl')
source=("https://github.com/holocm/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('a1b5f313e10ae3ef8ab4cc02ea5223ac5158604a25fe2c85b5a10d8cee62c07d')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    make
}

check() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    make check
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    make install DESTDIR="${pkgdir}"
}
