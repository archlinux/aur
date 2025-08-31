# Maintainer: lyk <lyk-boya@outlook.com>
pkgname=ttf-lxgw-wenkai-mono-nerd
pkgver=1.520
pkgrel=1
pkgdesc="LXGW WenKai Mono patched with Nerd Font glyphs"
arch=('any')
url="https://github.com/Yikai-Liao/LxgwWenKaiNerdFont"
license=('OFL')
depends=()
makedepends=('unzip')
_tag='v1.520'
source=("https://github.com/Yikai-Liao/LxgwWenKaiNerdFont/releases/download/${_tag}/lxgw-wenkai-nerd.zip" \
        "OFL.txt::https://raw.githubusercontent.com/Yikai-Liao/LxgwWenKaiNerdFont/${_tag}/OFL.txt")
sha256sums=('bc779c8dc41db7c042ca38c45a6ed79a1591bf89cb8204fc11587bd1fd37aa24'
            'ef535bf1a3c546928f8e97570f2c72603185f88fa4d82a6df6708348ad4c7614')

package() {
  cd "${srcdir}"
  mkdir -p "${pkgdir}/usr/share/fonts/TTF"
  unzip -q "${srcdir}/lxgw-wenkai-nerd.zip" -d extracted
  find extracted -type f -name '*MonoNerdFont-*.ttf' -exec install -Dm644 {} "${pkgdir}/usr/share/fonts/TTF/" \;
  install -Dm644 OFL.txt "${pkgdir}/usr/share/licenses/${pkgname}/OFL.txt"
}
