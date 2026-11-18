# Maintainer: lucas007 <lucaszhou007@163.com>

pkgname=go-ldap-admin
pkgver=0.6.2
pkgrel=1
pkgdesc="go-ldap-admin旨在为OpenLDAP服务端提供一个简单易用，清晰美观的现代化管理后台。"
url="https://github.com/opsre/go-ldap-admin"
arch=("x86_64" "aarch64" "loong64")
license=('Apache-2.0')
provides=('go-ldap-admin')
optdepends=('mysql: support mysql storage'
            'sqlite: support sqlite storage')
backup=("etc/${pkgname}/config.yml")
source=("go-ldap-admin.service"
        'go-ldap-admin.sysusers'
        'go-ldap-admin.tmpfiles')
sha256sums=('29a371a61eabd3eeb146b7b09caeaf7bd865cdec221319633d16cbb348eb9a53'
            'dbf9aa6215f9dfa1e070d8b3da80f2137da655e1e877ea6b03d738d21236947d'
            'b8bb19a4fb09a500c8abbba02d28fa0440a59ed0b18b99604acd3f164bb8163e')
sha256sums_x86_64=('3cb68c981ebbb5f78e3e1b077187ab9d92ced6324d8bfddb0ad7abe970487ab9')
sha256sums_aarch64=('e7f3422ac8f7095dccfb877757281f4a577f6a6faceb269fc56085f9ba1e2da3')
source_x86_64=("https://github.com/opsre/${pkgname}/releases/download/v${pkgver}/${pkgname}-v${pkgver}-linux-amd64.tar.gz")
source_aarch64=("https://github.com/opsre/${pkgname}/releases/download/v${pkgver}/${pkgname}-v${pkgver}-linux-arm64.tar.gz")

package() {
    install -Dm 644 "${srcdir}/config.yml"     "${pkgdir}/etc/go-ldap-admin/config.yml"
    install -Dm 755 "${srcdir}/go-ldap-admin" "${pkgdir}/usr/bin/go-ldap-admin"
    install -Dm 644 "${srcdir}/go-ldap-admin.service" "${pkgdir}/usr/lib/systemd/system/go-ldap-admin.service"
    install -Dm 644 "${srcdir}/${pkgname}.sysusers" "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
    install -Dm 644 "${srcdir}/${pkgname}.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf"
    install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
