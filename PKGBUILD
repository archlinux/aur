# Maintainer: Charles Leclerc <charles@la-mouette.net>
pkgname=h2-systemd
pkgver=1.0.0
pkgrel=1
pkgdesc="systemd service files for H2 database"
arch=(any)
license=('Apache')
depends=('h2')
source=('h2.service' 'h2.sysusers' 'h2.tmpfiles')
sha256sums=('608e09255bbd9cbec6f850b9c6caf8ef5b91303e5a648b5b31978277a32f640a'
            'b31bcfa1b8dc3c72bc3f12a8219f505b9e7e75dc3e9aeb46029da8db993eca4b'
            '6d0ef5107ef142656868bfddad7784d1b8a5f96c21595a6fef7fb76208375108')

package() {
    install -Dm 644 h2.service -t "${pkgdir}/usr/lib/systemd/system"
    install -Dm 644 h2.sysusers "${pkgdir}/usr/lib/sysusers.d/h2.conf"
    install -Dm 644 h2.tmpfiles "${pkgdir}/usr/lib/tmpfiles.d/h2.conf"
}
