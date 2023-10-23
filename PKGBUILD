# Maintainer: KawaiDesu <mail@zeym.org>
pkgname=vikunja-api-bin
pkgver=0.21.0
pkgrel=1
pkgdesc="The Todo-app to organize your life"
# TODO: Add mapping Arch's archs to vikunja's URLs to support all available archs (https://dl.vikunja.io/api/0.21.0)
arch=('x86_64')
url="https://vikunja.io/"
license=('AGPL3')
backup=('etc/vikunja/config.yml')
options=(!strip)
install=vikunja.install
source=("https://dl.vikunja.io/api/${pkgver}/vikunja-v${pkgver}-linux-amd64-full.zip"
        "vikunja-api.service"
        "vikunja.sysusers"
        "vikunja.tmpfiles"
        "config.yml")

sha256sums=('24d088d11df8539c51997401a36cd8e0b8fc3e1811edfdbb6c5a60247a7aa858'
            'b2175d88c19baa8f73d7d1363d80e3c0be54f0da89917c0209ba128426c0f1f8'
            '0a666743be3deaa16a436681d18003b11a1660b5fe7868fa25af2de11c7624f7'
            '77ae5d2215017969f561351a543f6777a0f55de20abb80094509188ba89e1f3e'
            'bd8537a6a74fa4c8d4ea789dd54a8684d9d696835762d1e3e36f06c9c9dfab7e')

package(){
  install -Dm755 "${srcdir}/vikunja-v${pkgver}-linux-amd64" "${pkgdir}/usr/bin/vikunja"
  install -Dm640 "${srcdir}/vikunja-api.service" "${pkgdir}/usr/lib/systemd/system/vikunja-api.service"
  install -Dm640 "${srcdir}/config.yml" "${pkgdir}/etc/vikunja/config.yml"
  install -Dm644 "${srcdir}/vikunja.sysusers" "${pkgdir}/usr/lib/sysusers.d/vikunja.conf"
  install -Dm644 "${srcdir}/vikunja.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/vikunja.conf"
}
