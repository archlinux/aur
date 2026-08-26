pkgname=v6emul-bin
pkgver=1.0.0
pkgrel=1
_date=2026.04.28
pkgdesc="Command-line emulator for the Vector-06C Soviet PC. Binary release"
arch=('x86_64')
url="https://github.com/parallelno/v6emul"
license=('MIT')
depends=('glibc' 'gcc-libs')
provides=("v6emul=${pkgver}")
conflicts=('v6emul')
options=('!strip' '!debug')
_archive="v6emul-${_date}-linux-x86_64"
source=("${_archive}.tar.gz::${url}/releases/download/v${pkgver}/${_archive}.tar.gz"
        "v6emul-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('b50bdce5957746140efd503a71feecce7a7521c876a24ab16a1d7e682f754f72'
            'ccf8c0dbc2df27d66af0d028a927f2821f1b9be2b254f42bc644215d4fe42ffb')

package() {
  install -Dm755 "${srcdir}/v6emul" "${pkgdir}/usr/bin/v6emul"

  cd "v6emul-${pkgver}"
  install -Dm644 -t "${pkgdir}/usr/share/v6emul/boot/" res/boot/*
  install -Dm644 -t "${pkgdir}/usr/share/v6emul/fdd/" res/fdd/*
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
