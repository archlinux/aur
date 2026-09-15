# Maintainer: Amolith <amolith@secluded.site>
pkgname='goradion-bin'
_pkgname="${pkgname%-bin}"
pkgdesc='Terminal based online radio player'
pkgver=0.10.0
pkgrel=1
arch=('x86_64' 'aarch64')
url="https://github.com/agejevasv/goradion"
license=('Unlicense')
depends=('mpv')
provides=("${_pkgname}=${pkgver}")
conflicts=("$_pkgname")

source_x86_64=("${_pkgname}-${pkgver}-x86_64::${url}/releases/download/v${pkgver}/${_pkgname}-linux-amd64")
source_aarch64=("${_pkgname}-${pkgver}-aarch64::${url}/releases/download/v${pkgver}/${_pkgname}-linux-arm64")
b2sums_x86_64=('3cbbec94093d8f8f952458280167f6ba5b32e5564e0f4856dcd1b1ef134e4333552241f75e5cae12de53dd9f75baf6f66fa28c76878ce3c9daf4986a558930dd')
b2sums_aarch64=('db57b7d500aad1cb577e07f54ccf059bfb9750ee5f5aba38e51d4a6da2d1122d0759f99f893c45fafd6834a3912d9ffcc66c301980623689f03e038078186248')

package() {
  install -Dm755 "${_pkgname}-${pkgver}-${CARCH}" "$pkgdir/usr/bin/$_pkgname"
}
