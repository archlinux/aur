# Maintainer: Kaizhao Zhang <zhangkaizhao@gmail.com>

_pkgname=netease-cloud-music-gtk

pkgname=netease-cloud-music-gtk-bin
pkgver=1.2.1
pkgrel=1
pkgdesc="Linux 平台下基于 Rust + GTK 开发的网易云音乐播放器"
arch=('x86_64')
url="https://github.com/gmg137/netease-cloud-music-gtk"
license=('GPL')
depends=('gstreamer' 'gtk3' 'gst-plugins-bad' 'gst-plugins-base' 'gst-plugins-good' 'gst-plugins-ugly' 'gst-libav' 'openssl')
optdepends=(
  'osdlyrics: Show lyrics'
)
conflicts=('netease-cloud-music-gtk')
source=(
  "https://gitee.com/gmg137/netease-cloud-music-gtk/attach_files/621007/download/${_pkgname}-${pkgver}-1.x86_64.rpm"
  "README-${pkgver}.md::${url}/raw/${pkgver}/README.md"
  "LICENSE-${pkgver}::${url}/raw/${pkgver}/LICENSE"
)
noextract=(
  "${_pkgname}-${pkgver}-1.x86_64.rpm"
)
sha256sums=(
  'cb15d5994a47be83d0b5c5a022b30c454a63d15447072daa7f81a836b3173a7b'
  'f0bfaab428267a65ad2ec11971a04acd1cb508dffa3dd2c899b19e11d55816ac'
  '3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986'
)

package() {
  cd "${srcdir}"
  bsdtar -xf "${_pkgname}-${pkgver}-1.x86_64.rpm" -C "${pkgdir}/"
  install -D -m644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -D -m644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
