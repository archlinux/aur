# Maintainer: lyk <lyk-boya@outlook.com>
pkgname=ttf-lxgw-wenkai-nerd
pkgver=1.522
pkgrel=1
pkgdesc="LXGW WenKai patched with Nerd Font glyphs"
arch=('any')
url="https://github.com/Yikai-Liao/LxgwWenKaiNerdFont"
license=('OFL')
depends=()
_tag='v1.522'
_asset='lxgw-wenkai-nerd-proportional-1.522.zip'
source=("ttf-lxgw-wenkai-nerd-1.522.zip::https://github.com/Yikai-Liao/LxgwWenKaiNerdFont/releases/download/${_tag}/${_asset}" \
        "OFL.txt::https://raw.githubusercontent.com/Yikai-Liao/LxgwWenKaiNerdFont/${_tag}/OFL.txt")
sha256sums=('869ff25053761f63d0cb36ebcdc87e7dcbfc888a9e9c8c89a7ccf2bdfede9126'
            'ef535bf1a3c546928f8e97570f2c72603185f88fa4d82a6df6708348ad4c7614')

package() {
  cd "${srcdir}"
  mkdir -p "${pkgdir}/usr/share/fonts/TTF"
  mkdir extracted
  bsdtar -xf "${srcdir}/ttf-lxgw-wenkai-nerd-1.522.zip" -C extracted
  find extracted -type f -name '*.ttf' -exec install -Dm644 {} "${pkgdir}/usr/share/fonts/TTF/" \;
  install -Dm644 OFL.txt "${pkgdir}/usr/share/licenses/${pkgname}/OFL.txt"
}
