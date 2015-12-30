pkgname='holo-ssh-keys'
pkgver=1.0
pkgrel=1
pkgdesc='Holo plugin for provisioning SSH public keys to $HOME/.ssh/authorized_keys'
arch=('any')
url='http://holocm.org'
license=('GPL3')
depends=(
    'openssh'
    'HOLO_API_VERSION=2'
)
makedepends=('go' 'perl')
install='holo-ssh-keys.install'
source=("https://github.com/holocm/${pkgname}/archive/v${pkgver}.tar.gz")
md5sums=('1fd333196b7467ac0e40a3da8981993c')

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
