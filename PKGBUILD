# Maintainer: lucas007 <lucaszhou007@163.com>

pkgname=go-ldap-admin
pkgver=0.6.0
pkgrel=1
pkgdesc="go-ldap-admin旨在为OpenLDAP服务端提供一个简单易用，清晰美观的现代化管理后台。"
url="https://github.com/opsre/go-ldap-admin"
arch=("x86_64" "aarch64" "loong64")
license=('Apache-2.0')
provides=('go-ldap-admin')
optdepends=('mysql: support mysql storage'
            'sqlite: support sqlite storage')
source=("go-ldap-admin.service")
sha256sums=("2e31bff9ad772067d75dbc64410b93108c478de8c1ae64d1f19f0e1cb9ff43e5")
source_x86_64=("https://github.com/opsre/${pkgname}/releases/download/v${pkgver}/${pkgname}-v${pkgver}-linux-amd64.tar.gz")
source_aarch64=("https://github.com/opsre/${pkgname}/releases/download/v${pkgver}/${pkgname}-v${pkgver}-linux-arm64.tar.gz")
sha256sums_x86_64=('3468f0b3f83172f090784a26d65910c23f0ca85eee4594d2438a82a929482f0a')
sha256sums_aarch64=('sha256:63c9975a3f71d309a8b2c3f87b48daf0ee0b148be8f80ebd67303edea2d9fe6c')

package() {
    install -Dm644 "${srcdir}/config.yml"     "${pkgdir}/etc/go-ldap-admin/config.yml"
    install -Dm755 "${srcdir}/go-ldap-admin" "${pkgdir}/usr/bin/go-ldap-admin"
    install -Dm755 "${srcdir}/go-ldap-admin.service" "${pkgdir}/usr/lib/systemd/system/go-ldap-admin.service"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}