# Maintainer: Kaizhao Zhang <zhangkaizhao@gmail.com>

_pkgname=netease-cloud-music-gtk

pkgname=netease-cloud-music-gtk-bin
pkgver=2.0.1
pkgrel=1
pkgdesc="Linux 平台下基于 Rust + GTK 开发的网易云音乐播放器"
arch=('x86_64')
url="https://github.com/gmg137/netease-cloud-music-gtk"
license=('GPL')
depends=('gstreamer' 'gst-plugins-bad' 'gst-plugins-base' 'gst-plugins-good' 'gst-plugins-ugly' 'gst-libav' 'libadwaita' 'openssl')
conflicts=('netease-cloud-music-gtk')
source=(
  "https://download.opensuse.org/repositories/openSUSE:/Factory/standard/x86_64/${_pkgname}-${pkgver}-2.1.x86_64.rpm"
  "${url}/releases/download/${pkgver}/${_pkgname}-lang-${pkgver}-26.1.noarch.rpm"
  "README-${pkgver}.md::${url}/raw/${pkgver}/README.md"
)
noextract=(
  "${_pkgname}-${pkgver}-2.1.x86_64.rpm"
  "${_pkgname}-lang-${pkgver}-26.1.noarch.rpm"
)
sha256sums=(
  '844734eada20a5f336d2cdc56c1cbe882c15f561663a9ad65ccce8740a4d8f83'
  'b92cad7140a22e6ba792d8d796ad57b0154146f55fe9f09de09ba25ba4411fcb'
  'c9b60b78cebbc05945f226b5e58b2f6586bf532d836233a8bbc3e17fac90db4a'
)

package() {
  cd "${srcdir}"
  bsdtar -xf "${_pkgname}-${pkgver}-2.1.x86_64.rpm" -C "${pkgdir}/"
  bsdtar -xf "${_pkgname}-lang-${pkgver}-26.1.noarch.rpm" -C "${pkgdir}/"
  install -D -m644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
}
