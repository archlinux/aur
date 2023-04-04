# Maintainer: robertfoster

pkgname=iortcw-data
pkgver=1.51c
pkgrel=5
pkgdesc="Return to Castle Wolfenstein Single Player pk3s files (shared use)"
arch=('any')
url="https://github.com/iortcw/iortcw"
license=('GPL3')
install='iortcw-data.install'
source=("https://github.com/iortcw/iortcw/releases/download/${pkgver}/patch-data-141.zip"
  "https://github.com/M0Rf30/rtcw-assets/raw/master/sp_pak2.pk3"
  "https://github.com/M0Rf30/rtcw-assets/raw/master/mp_pak1.pk3"
  "https://github.com/M0Rf30/rtcw-assets/raw/master/mp_pak2.pk3"
  'openurl.sh')
noextract=('sp_pak2.pk3' 'mp_pak1.pk3' 'mp_pak2.pk3')

package() {

  cd "${srcdir}"

  # Move Data to Package Directory
  mkdir -p "${pkgdir}/opt"
  cp -r main "${pkgdir}/opt/iortcw-data"
  cp sp_pak2.pk3 "${pkgdir}/opt/iortcw-data"
  cp mp_pak1.pk3 "${pkgdir}/opt/iortcw-data"
  cp mp_pak2.pk3 "${pkgdir}/opt/iortcw-data"
  install -D -m 755 openurl.sh \
    "${pkgdir}/opt/iortcw-data"

  # Clean unneeded files
  find "${pkgdir}" -name "*.dll" -exec rm {} \;
  find "${pkgdir}" -name "*.so" -exec rm {} \;
}

sha256sums=('7fe0f5d04967bd3f2f66017a832d1bffec8796a04cf651401c0ff3d5024f3e47'
  'eca64ea0fda6edd653865e2eb768f152d38abc8b89941aa954ed74fa36928796'
  '248ff7c6a4c12f3fc08e0bb73a0602ffdb2e31c4a4c50929d76fa5f814cbf974'
  '0a9142be2539427189cc9b31d5af188298ce3e4c8f06d752e1809d22046b7b03'
  '111e4bd7d77d71cbb0a09682310b5a0534859e6cb66aeadd3fad548f9d95558b')
