# Maintainer: Bruno Pagani (a.k.a. ArchangeGabriel) <bruno.n.pagani@gmail.com>
# Contributor: Romain Labolle <ravomavain@gmail.com>

_pkgname=certbot
pkgname=${_pkgname}-user
pkgver=1.0.0
pkgrel=1
pkgdesc="Let’s Encrypt certbot systemd files for running as certbot user rather than root, with either standalone or webroot mode."
arch=('any')
license=('Apache')
url="https://${_pkgname}.eff.org"
depends=('certbot' 'systemd')
source=("${_pkgname}.service"
        "${_pkgname}.timer"
        "${_pkgname}.tmpfiles"
        "${_pkgname}.sysusers")
sha256sums=('e232526dc2cef75dce88c0e81505e9f86dccaa0a918ac1d633d731839789d41f'
            'cc5d7efe48a12b4605cd4d80e1883b1a87b80f937ca411fb051e9ca3df8cfa70'
            '1691fdc90dcc07f0e3483d10ad6f1ceee65f089ee5fc17238e66d2a3e6e2e905'
            '151621a821f56178408851e016c7fda67dc4c726f210ad3279b29fd1f43282fa')

package() {
    install -Dm644 ${_pkgname}.{service,timer} -t "${pkgdir}"/usr/lib/systemd/system/
    install -Dm644 ${_pkgname}.tmpfiles "${pkgdir}"/usr/lib/tmpfiles.d/${_pkgname}.conf
    install -Dm644 ${_pkgname}.sysusers "${pkgdir}"/usr/lib/sysusers.d/${_pkgname}.conf
}
