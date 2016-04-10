pkgname='holo-ssh-keys'
pkgver=1.1
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
install='holo-ssh-keys.install'
source=("https://github.com/holocm/${pkgname}/archive/v${pkgver}.tar.gz")
md5sums=('739f3d3704dbba86373732142e0ced62')

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
