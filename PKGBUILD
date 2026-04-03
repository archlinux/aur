# Maintainer: lyk <lyk-boya@outlook.com>
pkgname=ttf-lxgw-wenkai-mono-nerd
pkgver=1.522
pkgrel=1
pkgdesc="LXGW WenKai Mono patched with Nerd Font glyphs"
arch=('any')
url="https://github.com/Yikai-Liao/LxgwWenKaiNerdFont"
license=('OFL')
depends=()
_tag='v1.522'
_asset='lxgw-wenkai-nerd-mono-1.522.zip'
source=("ttf-lxgw-wenkai-mono-nerd-1.522.zip::https://github.com/Yikai-Liao/LxgwWenKaiNerdFont/releases/download/${_tag}/${_asset}" \
        "OFL.txt::https://raw.githubusercontent.com/Yikai-Liao/LxgwWenKaiNerdFont/${_tag}/OFL.txt")
sha256sums=('df588b8c8cad637d285493745aa018145d52df05720975224ba75e5d08f33e21'
            'ef535bf1a3c546928f8e97570f2c72603185f88fa4d82a6df6708348ad4c7614')

package() {
  cd "${srcdir}"
  mkdir -p "${pkgdir}/usr/share/fonts/TTF"
  mkdir extracted
  bsdtar -xf "${srcdir}/ttf-lxgw-wenkai-mono-nerd-1.522.zip" -C extracted
  find extracted -type f -name '*.ttf' -exec install -Dm644 {} "${pkgdir}/usr/share/fonts/TTF/" \;
  install -Dm644 OFL.txt "${pkgdir}/usr/share/licenses/${pkgname}/OFL.txt"
}
