# Maintainer: willker <wz[dot]willker[at]gmail[dot]com>

pkgname=nipaplay-reload-bin
_pkgname=NipaPlay
_desktop_name=io.github.MCDFsteve.NipaPlay-Reload
pkgver=1.11.5
pkgrel=1
pkgdesc="一个现代化的跨平台视频播放器"
arch=('x86_64')
url="https://github.com/MCDFsteve/NipaPlay-Reload"
license=('MIT')
depends=('mpv' 'gtk3' 'ffmpeg' 'libass' 'libkeybinder3' 'libayatana-appindicator')
provides=("${pkgname%-reload-bin}" "${pkgname%-bin}")
conflicts=("${pkgname%-reload-bin}" "${pkgname%-bin}")
options=('!debug')
source=(
  "${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-Linux-amd64.deb"
  "${url}/raw/main/LICENSE"
)
sha256sums=('2e331986734b5b7bf60c0af52249ef5a7dc160ac5660165c02888ba30da56f31'
            'fd1d762b5ea1f4cd690235a1b8d6b8efe4ada061f5b26c1fefbd74c156f8184b')

package() {
  cd "$srcdir"
  tar -xf data.tar.zst -C "$pkgdir"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
