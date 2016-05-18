# Contributor: Marcin (CTRL) Wieczorek <marcin@marcin.co>
# Contributor: Ianis G. Vasilev <mail@ivasilev.net>

pkgname=psmouse-alpsv7-dkms
pkgver=20140319
pkgrel=5
pkgdesc='psmouse kernel module with support for alpsv7 touchpad'
arch=('any')
url='https://github.com/he1per/psmouse-dkms-alpsv7'
license=('GPL2')
depends=('dkms')
makedepends=('linux-headers')
source=('psmouse-alpsv7-dkms::git://github.com/he1per/psmouse-dkms-alpsv7.git'
        'kernel-4.patch::https://github.com/hyslion/psmouse-dkms-alpsv7/commit/f81f0ec2af851a78cd5a2b778c0d51a10fa01999.patch')

md5sums=('SKIP'
         'c573b665d5432da4738f7d96a7593608')

prepare() {
    cd "${srcdir}/${pkgname}"
    patch -p1 < "../kernel-4.patch"
}

package() {
    cd "${srcdir}/${pkgname}"
    sudo ./install.sh
}
