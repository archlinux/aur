# Maintainer: Johannes Wienke <languitar@semipol.de>

pkgname=puppet-editor-services
pkgver=0.23.0
pkgrel=1
pkgdesc="Language server implementation for puppet"
arch=('any')
url="https://github.com/lingua-pupuli/puppet-editor-services"
license=('Apache')
depends=('ruby' 'puppet')
source=(https://github.com/lingua-pupuli/puppet-editor-services/archive/${pkgver}.tar.gz
        puppet-languageserver
        puppet-debugserver)
sha256sums=('35329d1c980827036c9f4a9c2a9d735129c2aecf3d82d895f354d7a6cc12ea4a'
            '09b7fab427b8d8001eae55f111030085e87b0324402964a1f6a4bb228e6566e5'
            '4f5b74a35cb288d86fda10ac88f3e3f76ae1a8b04ee559c574f4d4b2ab94326b')

package() {
    cd "${srcdir}/puppet-editor-services-${pkgver}"
    mkdir -p "${pkgdir}/opt/puppet-editor-services"
    cp -R ./* "${pkgdir}/opt/puppet-editor-services"
    mkdir -p "${pkgdir}/usr/bin"
    cp "${srcdir}/puppet-languageserver" "${pkgdir}/usr/bin"
    cp "${srcdir}/puppet-debugserver" "${pkgdir}/usr/bin"
}
