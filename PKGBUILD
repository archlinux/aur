# Maintainer: lyk <lyk-boya@outlook.com>
pkgname=ttf-lxgw-wenkai-nerd
pkgver=1.530
pkgrel=1
pkgdesc="LXGW WenKai patched with Nerd Font glyphs"
arch=('any')
url="https://github.com/Yikai-Liao/LxgwWenKaiNerdFont"
license=('OFL')
depends=()
_tag='v1.530'
_asset='lxgw-wenkai-nerd-proportional-1.530.zip'
source=("ttf-lxgw-wenkai-nerd-1.530.zip::https://github.com/Yikai-Liao/LxgwWenKaiNerdFont/releases/download/${_tag}/${_asset}" \
        "OFL.txt::https://raw.githubusercontent.com/Yikai-Liao/LxgwWenKaiNerdFont/${_tag}/OFL.txt")
sha256sums=('3f8466e8c70d8668bf0768322f39fa310aa78ade1362aee2fd5e05874a6766ca'
            'ef535bf1a3c546928f8e97570f2c72603185f88fa4d82a6df6708348ad4c7614')

package() {
  cd "${srcdir}"
  mkdir -p "${pkgdir}/usr/share/fonts/TTF"
  mkdir extracted
  bsdtar -xf "${srcdir}/ttf-lxgw-wenkai-nerd-1.530.zip" -C extracted
  find extracted -type f -name '*.ttf' -exec install -Dm644 {} "${pkgdir}/usr/share/fonts/TTF/" \;
  install -Dm644 OFL.txt "${pkgdir}/usr/share/licenses/${pkgname}/OFL.txt"
}
