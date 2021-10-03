# Maintainer: goetzc

_name=tremulous
_version=1.3.0-alpha.0.14
pkgname="${_name}-grangerhub-bin"
pkgver=1.3.0_alpha.0.14
pkgrel=1
pkgdesc="Team based FPS/RTS hybrid built on the open ioq3 engine. GrangerHub"
url="https://github.com/grangerhub/tremulous"
arch=(x86_64)
license=(GPL)
depends=(sdl openal libgl freetype2 glu)
provides=(tremulous)
conflicts=(tremulous)
source=("$pkgname-$pkgver.zip::${url}/releases/download/v${_version}/release-linux-${arch}.zip"
        tremded.sh
        tremulous.sh
        tremulous.desktop
        tremulous.xpm)
backup=('etc/tremdedrc')

_arch="${CARCH/i686/x86}"

package() {
  cd "${srcdir}"

  install -D -m755 "tremded.sh" "${pkgdir}/usr/bin/tremded"
  install -D -m755 "tremulous.sh" "${pkgdir}/usr/bin/tremulous"

  install -D -m755 "tremded" "${pkgdir}/opt/tremulous/tremded"
  install -D -m755 "tremulous" "${pkgdir}/opt/tremulous/tremulous"
  install -D -m755 "renderer_opengl1.so" "${pkgdir}/opt/tremulous/renderer_opengl1.so"
  install -D -m755 "renderer_opengl2.so" "${pkgdir}/opt/tremulous/renderer_opengl2.so"

  cp -a "gpp" "${pkgdir}/opt/tremulous/"
  cp -a "gpp_11" "${pkgdir}/opt/tremulous/"
  cp -a "scripts" "${pkgdir}/opt/tremulous/"

  # Install the .desktop, icon files, license, etc.
  install -D -m644 "${srcdir}/tremulous.xpm" "${pkgdir}/usr/share/pixmaps/tremulous.xpm"
  install -D -m644 "${srcdir}/tremulous.desktop" "${pkgdir}/usr/share/applications/tremulous.desktop"
  install -D -m644 "${srcdir}/COPYING" "${pkgdir}/usr/share/licenses/${_pkgname}/COPYING"
  install -D -m644 "${srcdir}/GPL" "${pkgdir}/usr/share/licenses/${_pkgname}/GPL"
}

sha256sums=('cc2c085c75b8ef8f77173bd918feec0628377e40ec87d49e851881df07fe6358'
            '93acf31a216c88eb358ab2a2156a882939ddba65f5e6f23093bd773d389d03ee'
            '59dd383809cfe1064505adf436c921b0783eb542720e97a73291746b17f85399'
            '9af436e7f004abeb043276de6948d6142a8a4cfb554993b7aa8d9e09e41acafa'
            '0770cc5e153b25e00d42077e3f0e7f813264f1db468efca2a26083a5d38301d1')
