# Maintainer: shbernal <shbernal.01@gmail.com>

_pkgname=philosophic-moon
pkgname=${_pkgname}-bin
pkgver=0.3.5
pkgrel=1
pkgdesc='A shared moon in your terminal: chat, stargazing, a communal plant and a graffiti wall'
arch=('x86_64')
url='https://github.com/SorBalda/philosophic-moon'
license=('LicenseRef-PolyForm-Perimeter-1.0.0')
depends=('glibc')
optdepends=('alsa-lib: music playback'
            'libpulse: music playback through PulseAudio or PipeWire')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
options=('!strip' '!debug')

_raw="https://raw.githubusercontent.com/SorBalda/${_pkgname}/v${pkgver}"
source=("moon-${pkgver}::${url}/releases/download/v${pkgver}/moon-linux-amd64"
        "LICENSE-${pkgver}::${_raw}/LICENSE"
        "TRADEMARK-${pkgver}.md::${_raw}/TRADEMARK.md"
        "README-${pkgver}.md::${_raw}/README.md")
sha256sums=('21ef29e95a708b8c80269bf5035145d12ab57864f7a97c5a7fe6bef7b81775d0'
            '5476c0deab6e777714c13a8316aba0471999ba8014c1fbfa27fae54f2038a192'
            'd7639fb6d24f551945e4b092bf2a008ebc9ee01dbeefe52e2c4003f0d1a7dfc9'
            '95b5f4f3a6de9046135a7816157ae5ebaf8338b5d424d484c452b778c7d9338f')

package() {
  install -Dm755 "moon-${pkgver}" "${pkgdir}/usr/bin/moon"
  install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "TRADEMARK-${pkgver}.md" "${pkgdir}/usr/share/licenses/${pkgname}/TRADEMARK.md"
  install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
