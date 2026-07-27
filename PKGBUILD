# Maintainer: mapleafgo <mapleafgo at 163 dot com>
pkgname=singcast
epoch=1
pkgver=1.1.17
pkgrel=1
pkgdesc="A clash GUI client based on Flutter"
arch=('x86_64' 'aarch64')
url="https://github.com/mapleafgo/singcast"
license=('MIT')
conflicts=(${pkgname})
provides=(${pkgname})
depends=('gtk3' 'libayatana-appindicator' 'polkit' 'acl' 'libcap')
install=singcast.install
source_x86_64=(${pkgname}-${pkgver}-x86_64.zip::https://github.com/mapleafgo/singcast/releases/download/v${pkgver}/singcast-${pkgver}-linux-amd64-portable.zip
             singcast.desktop
             singcast.svg
             singcast.install)
_install_path="/opt/Singcast"
source_aarch64=(${pkgname}-${pkgver}-aarch64.zip::https://github.com/mapleafgo/singcast/releases/download/v${pkgver}/singcast-${pkgver}-linux-arm64-portable.zip
             singcast.desktop
             singcast.svg
             singcast.install)


package() {
  install -dm755 "${pkgdir}${_install_path}"

  cp -a "${srcdir}/lib" "${pkgdir}${_install_path}/lib"
  cp -a "${srcdir}/data" "${pkgdir}${_install_path}/data"
  install -Dm755 "${srcdir}/singcast" "${pkgdir}${_install_path}/singcast"
  install -Dm755 "${srcdir}/singcast-core" "${pkgdir}${_install_path}/singcast-core"

  install -dm755 "${pkgdir}/usr/bin"
  ln -snf "${pkgdir}/${_install_path}/singcast" "${pkgdir}/usr/bin/${pkgname}"

  install -Dm644 "singcast.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/singcast.svg"
  install -Dm644 "singcast.desktop" "${pkgdir}/usr/share/applications/singcast.desktop"
}

sha256sums_x86_64=('e0a21522cc25f49c7b59bb1792743a18d9b435296ce96b3bc381455026fee819'
                   '0ba2701f7a7dd7f883014b4bcd585b8ccbdfddeced56e45ab55067c43cbe8d3e'
                   '289d9ffd1ea9b24928bea1a0936d9a1125e7f3d9e2d7341e353ce5c42d405f09'
                   '671ce4bf94e3c8e4c97b07610cf40e2fbf36bd27d80b76063708d7ad644f1268')
sha256sums_aarch64=('bb76dd0ba4ed4e8e7c7acfe386c522bd6950a324becf53f36aeaa78dc402c47f'
                    '0ba2701f7a7dd7f883014b4bcd585b8ccbdfddeced56e45ab55067c43cbe8d3e'
                    '289d9ffd1ea9b24928bea1a0936d9a1125e7f3d9e2d7341e353ce5c42d405f09'
                    '671ce4bf94e3c8e4c97b07610cf40e2fbf36bd27d80b76063708d7ad644f1268')