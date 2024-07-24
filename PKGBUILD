# Maintainer: Your Name <you@example.com>
pkgname=lsl
pkgver=1.0.0
pkgrel=1
_?commit='a5f4f4ee5989ce188c44094c526c5b454ae01f7a'
pkgdesc='linux subsystem for linux'
arch=('any')
url='https://gitlab.com/sulincix/debian-subsystem/'
license=('MIT')
depends=('glibc')
makedepends=('git' 'pam' 'gcc' 'debootstrap')
source=("${pkgname}-${pkgver}::https://gitlab.com/sulincix/debian-subsystem/-/archive/a5f4f4ee5989ce188c44094c526c5b454ae01f7a/debian-subsystem-a5f4f4ee5989ce188c44094c526c5b454ae01f7a.zip")
md5sums=('SKIP')

build() {
    make -C "${pkgname}-${pkgver}" all
}

package() {
    make -C "${pkgname}-${pkgver}/" DESTDIR="${pkgdir}" install
}
