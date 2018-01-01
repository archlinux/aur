# former Maintainer: Thomas Fanninger <thomas AT fanninger DOT at>
# Contributor: Mohammed Yaseen Mowzer <moyamodehacker@gmail.com>
# Contributor: Hugo Osvaldo Barrera <hugo@barrera.io>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=('python-yowsup' 'python2-yowsup')
pkgdesc='The open source cross platform Whatsapp library powering Wazapp - Python 2'
pkgver=2.5.7
pkgrel=1
pkgdesc="The open source cross platform Whatsapp library powering Wazapp"
url="https://github.com/tgalal/yowsup"
arch=('any')
license=('GPL')
makedepends=('python2-setuptools' 'python2-dateutil' 'python2-argparse' 'python2-axolotl' 'python2-pillow' 'python-setuptools')
provide=('python-yowsup')
conflicts=('yowsup-client-git' 'python-yowsup-git')
source=("${pkgname}-${pkgver}.tag.gz::https://github.com/tgalal/yowsup/archive/v${pkgver}.tar.gz")
sha512sums=('e64e119e8301d6cd9244a24ce960fdd00a5372a7766cf2f52dfd7610828358086e6c4f77fba6f962c1b84f6b28fa6b6d4d708bbb50c281e5a6563b99634b9495')

package_python-yowsup() {
    cd "${srcdir}/yowsup-${pkgver}"
    depends=('python' 'python-dateutil' 'python-argparse' 'python-axolotl' 'python-pillow')

    cd "${srcdir}/yowsup-${pkgver}"
    python setup.py install --prefix=/usr --root=$pkgdir --optimize=1
    mkdir -p "$pkgdir"/usr/share/
    mv "$pkgdir"/usr/yowsup "$pkgdir"/usr/share/yowsup
}

package_python2-yowsup() {
    depends=('python2' 'python2-dateutil' 'python2-argparse' 'python2-axolotl' 'python2-pillow')

    cd "${srcdir}/yowsup-${pkgver}"
    python2 setup.py install --prefix=/usr --root=$pkgdir --optimize=1
    mkdir -p "$pkgdir"/usr/share/
    mv "$pkgdir"/usr/yowsup "$pkgdir"/usr/share/yowsup
}

check(){
    cd "${srcdir}/yowsup-${pkgver}"
    python2 setup.py test
}
