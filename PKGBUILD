# Maintainer: Kaizhao Zhang <zhangkaizhao@gmail.com>

_pkgname=netease-cloud-music-gtk

pkgname=netease-cloud-music-gtk-bin
pkgver=0.5.0
pkgrel=1
pkgdesc="Linux 平台下基于 Rust + GTK 开发的网易云音乐播放器"
arch=('x86_64')
url="https://github.com/gmg137/netease-cloud-music-gtk"
license=('GPL')
depends=('curl' 'gstreamer' 'gtk3' 'gst-plugins-bad' 'gst-plugins-good' 'gst-plugins-ugly' 'gst-libav' 'openssl')
optdepends=(
  'osdlyrics: Show lyrics'
)
conflicts=('netease-cloud-music-gtk')
source=(
  "${url}/releases/download/${pkgver}/${_pkgname}-${pkgver}-1.x86_64.tar.xz"
  "${url}/raw/${pkgver}/README.md"
  "${url}/raw/${pkgver}/LICENSE"
)
noextract=("${_pkgname}-${pkgver}-1.x86_64.tar.xz")
sha256sums=(
  '8333fc0d3700f9373778dd9deaebe8fea494f312e8fa03fce5ad2adc3c5a8d08'
  'e7868e8602ec34d4ed424c058f8f5babf3df90ac9a9016fcb3ab7d359edfb072'
  '3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986'
)

package() {
  cd "${srcdir}"
  bsdtar -xf "${_pkgname}-${pkgver}-1.x86_64.tar.xz" -C "${pkgdir}/"
  install -D -m644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
