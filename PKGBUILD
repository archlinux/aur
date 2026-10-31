# Maintainer: hikari <me@metantesan.com>
pkgname=mitsuzo-bin
pkgver=0.15.1
pkgrel=1
pkgdesc='Encrypted, self-hostable handoff for secrets and short-lived files (CLI, prebuilt binary)'
arch=('x86_64' 'aarch64')
url='https://github.com/metantesan/mitsuzo'
license=('BSD-3-Clause')
depends=('gcc-libs' 'glibc')
provides=('mitsuzo')
conflicts=('mitsuzo')
options=('!strip')
_repo='metantesan/mitsuzo'

source=("LICENSE.mitsuzo::https://raw.githubusercontent.com/${_repo}/v${pkgver}/LICENSE"
        "mitsuzo.1")
source_x86_64=("mitsuzo-${pkgver}-x86_64.zip::https://github.com/${_repo}/releases/download/v${pkgver}/mitsuzo-x86_64-unknown-linux-gnu.zip")
source_aarch64=("mitsuzo-${pkgver}-aarch64.zip::https://github.com/${_repo}/releases/download/v${pkgver}/mitsuzo-aarch64-unknown-linux-gnu.zip")
sha256sums=('361891259c2eb84d05465c6ce04eb8d6327baecd95462a78c3604ebfcd7d570a'
            '48254d4c6776a8ce1691e3f02e568277bf140974271d6e02537674d466be46a4')
sha256sums_x86_64=('d5b49c4b887d92bb475863cbab319f2c34cde5bcd2918535dce55e4796aa9922')
sha256sums_aarch64=('e0bfffba3bcd1181989db31ac5b32e475b67f9d6215aeae8c797ce1bf1b96a36')

package() {
  install -Dm755 "${srcdir}/mitsuzo" "${pkgdir}/usr/bin/mitsuzo"
  install -Dm644 "${srcdir}/mitsuzo.1" "${pkgdir}/usr/share/man/man1/mitsuzo.1"
  install -Dm644 "${srcdir}/LICENSE.mitsuzo" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
