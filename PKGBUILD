# Maintainer: Kaizhao Zhang <zhangkaizhao@gmail.com>

_pkgname=netease-cloud-music-gtk

pkgname=netease-cloud-music-gtk-bin
pkgver=1.1.2
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
  "https://download.opensuse.org/repositories/openSUSE:/Factory/standard/x86_64/${_pkgname}-${pkgver}-1.1.x86_64.rpm"
  "README-${pkgver}.md::${url}/raw/${pkgver}/README.md"
  "LICENSE-${pkgver}::${url}/raw/${pkgver}/LICENSE"
)
noextract=("${_pkgname}-${pkgver}-1.1.x86_64.rpm")
sha256sums=(
  '673da0f7466c266467427da58f3d570317241bfe25a7dc58e36ed59b70173e0b'
  '5ffd318e287d37c2ab62739cc974bc9b2ebd2b42cf8a20c8dbbf26f944c6b744'
  '3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986'
)

package() {
  cd "${srcdir}"
  bsdtar -xf "${_pkgname}-${pkgver}-1.1.x86_64.rpm" -C "${pkgdir}/"
  install -D -m644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -D -m644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
