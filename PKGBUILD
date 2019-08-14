pkgname=ultra-simple-screen-recorder-git
_pkgname=ussr
pkgver=r4.cf575cb
pkgrel=1
pkgdesc="Recording screen on Linux using kmsgrab and vaapi"
arch=('x86_64')
url="https://github.com/Saren-Arterius/ussr"
depends=('intel-media-driver' 'ffmpeg' 'lemonbar-xft-git' 'python-notify2')
source=('git+https://github.com/Saren-Arterius/ussr.git' 'ussr.desktop' 'logo.png')
sha256sums=('SKIP' 'c0100e49673d27d49963768c31b6cc8f98f3241e33b732da8ccdfef1424000f7' 'SKIP')

pkgver() {
  cd "${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  mkdir -p ${pkgdir}/opt/${_pkgname}
  install -Dm644 "../ussr.desktop" "${pkgdir}/usr/share/applications/ussr.desktop"
  install -Dm644 "../logo.png" "${pkgdir}/opt/${_pkgname}/logo.png"
  cd "${_pkgname}"
  install -Dm755 "ussr.py" "${pkgdir}/opt/${_pkgname}/ussr.py"
  install -Dm644 "pyxhook.py" "${pkgdir}/opt/${_pkgname}/pyxhook.py"
  install -Dm644 "notify-send.py" "${pkgdir}/opt/${_pkgname}/notify-send.py"
}
