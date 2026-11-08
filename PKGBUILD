# Maintainer: aNNiMON <annimon119 at gmail dot com>
_pkgauthor=aNNiMON
_pkgname=effy
pkgname=effy-bin
pkgver=0.11.0
pkgrel=1
pkgdesc="A small and friendly terminal FFmpeg helper that simplifies common tasks. Binaries only"
url="https://projects.annimon.com/projects/effy/"
license=('MIT')
depends=('ffmpeg' 'gcc-libs' 'glibc')
optdepends=('wl-clipboard: copy commands on Wayland'
            'xclip: copy commands on X11'
            'xsel: copy commands on X11 (xclip alternative)')
arch=('x86_64' 'aarch64')
options=('!debug')
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
source=("${_pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/v${pkgver}/LICENSE")
source_x86_64=("${_pkgname}-${pkgver}-x86_64-linux.tar.gz::https://github.com/${_pkgauthor}/${_pkgname}/releases/download/v${pkgver}/${_pkgname}-x86_64-linux.tar.gz")
source_aarch64=("${_pkgname}-${pkgver}-aarch64-linux.tar.gz::https://github.com/${_pkgauthor}/${_pkgname}/releases/download/v${pkgver}/${_pkgname}-aarch64-linux.tar.gz")
b2sums=('2c213e2079debd90949345ff3586aa6e52ed8379bbe643beadf5b82cd4db08ab602c11acff786f783fac1dcf9fce1a5d61905e19a3fbb202457410d03f2ce772')
b2sums_x86_64=('a18be8790513b93bb54f4976fd7ba2705a08c6d3414e31505816af574e5e57b66cc22f232ba8ed47eb4211a83e96ea418c5ad8056a3197ce936acb0de856b0b0')
b2sums_aarch64=('408ed09f005ba5a6125a8dbf98cefe6443947b05bf456adaedb56fbf45e3d9563e99b339229e94cef60994036e1256e8db0a1d04c7f872900290e72c30861639')

package() {
  install -Dm755 -t "$pkgdir/usr/bin/" "$_pkgname"
  install -Dm644 "${_pkgname}-${pkgver}-LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
