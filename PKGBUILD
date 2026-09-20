# Maintainer: aNNiMON <annimon119 at gmail dot com>
_pkgauthor=aNNiMON
_pkgname=effy
pkgname=effy-bin
pkgver=0.10.0
pkgrel=2
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
b2sums_x86_64=('ebfba7d0adae010be9648bee559cf888a24b348dee5c6703e35a492f79cffa9c064c5fa6b04048112ef87ded854978a01dfe1b09436fbe7612cf28f3b9c30a4b')
b2sums_aarch64=('8f009481e47b5502730123271dc74dbd6ddcbb70034a8b831f7c292360be2fe73b724b6aa98f4369f7124cdfeb669379ab13bc496508e464d27a01c424bce215')

package() {
  install -Dm755 -t "$pkgdir/usr/bin/" "$_pkgname"
  install -Dm644 "${_pkgname}-${pkgver}-LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
