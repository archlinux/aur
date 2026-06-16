# Maintainer: juacker
# Auto-updated by .github/workflows/aur.yml on each release.
# 26.6.16 and 0640792edafa2b72c1949f55c8158c11caa73a3e857aeb7121656aa4a9e5c3f4 are replaced by CI; to build locally, fill them in
# (sha256 of the release .deb) or run: makepkg -g

pkgname=clai-desktop-bin
pkgver=26.6.16
pkgrel=1
pkgdesc="Desktop app for building, running, and supervising teams of AI agents"
arch=('x86_64')
url="https://github.com/juacker/clai"
license=('MIT')
depends=('webkit2gtk-4.1' 'gtk3' 'libsecret' 'openssl' 'bubblewrap' 'hicolor-icon-theme')
# Installs /usr/bin/clai, same as the (unrelated) clai/clai-bin packages
conflicts=('clai')
options=('!strip' '!debug')
source=("${url}/releases/download/v${pkgver}/clai_${pkgver}_amd64.deb"
        "${url}/raw/v${pkgver}/LICENSE")
sha256sums=('0640792edafa2b72c1949f55c8158c11caa73a3e857aeb7121656aa4a9e5c3f4'
            'SKIP')

package() {
  # makepkg already unpacked the .deb (ar archive) into srcdir
  tar -xzf "${srcdir}/data.tar.gz" -C "${pkgdir}"
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
