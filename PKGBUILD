pkgname='holo-ssh-keys'
pkgver=1.2.1
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
sha256sums=('3e483da9f07963f21718634d249ec975e980c655e2ccf31d942692c606493d94')
backup=(
    'etc/holorc.d/25-ssh-keys'
)

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
