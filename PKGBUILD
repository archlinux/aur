# Maintainer: nico <nico@example.com>
pkgname=memoa-bin
pkgver=0.1.375
pkgrel=1
pkgdesc="The best for Markdown Editing"
arch=('aarch64' 'x86_64')
url="https://example.com/memoa"
license=('unknown')
depends=('gtk3' 'webkit2gtk' 'openssl')
provides=('memoa')
conflicts=('memoa')
options=('!strip')
source=("memoa.png"
        "memoa.desktop")
source_aarch64=("https://repository.hellonico.info/repository/arch/memoa/${pkgver}/memoa_aarch64")
source_x86_64=("https://repository.hellonico.info/repository/arch/memoa/${pkgver}/memoa_x86_64")

sha256sums=('72efe0d27e0fb81dd20b151c240ce99dddea08afcb1c6b2deb7556ed2b2690e5'
            '8bbe11862d09b4d2fa9820b530c16ac6681e52bfe64fb3d8e20cebc9bdb8c2a2')
sha256sums_aarch64=('445019c7d43088c1f7b4cfc0c391882b4da1e2e34193fdec7d7422e6d9f71b0c')
sha256sums_x86_64=('a5a9aeef7abe11a74722ac4e958f2643b3f2c85132b920d152141fa4cafb3e84')

package() {
  install -Dm644 "${srcdir}/memoa.png" "${pkgdir}/usr/share/pixmaps/memoa.png"
  install -Dm644 "${srcdir}/memoa.desktop" "${pkgdir}/usr/share/applications/memoa.desktop"
  
  if [ "$CARCH" = 'aarch64' ]; then
    install -Dm755 "${srcdir}/memoa_aarch64" "${pkgdir}/usr/bin/memoa"
  elif [ "$CARCH" = 'x86_64' ]; then
    install -Dm755 "${srcdir}/memoa_x86_64" "${pkgdir}/usr/bin/memoa"
  fi
}
