# Maintainer: lyk <lyk-boya@outlook.com>
pkgname=ttf-lxgw-wenkai-mono-nerd
pkgver=v1.520
pkgrel=1
pkgdesc="LXGW WenKai Mono patched with Nerd Font glyphs"
arch=('any')
url="https://github.com/Yikai-Liao/LxgwWenKaiNerdFont"
license=('OFL')
depends=()
makedepends=('unzip')
_tag='vv1.520'
source=("https://github.com/Yikai-Liao/LxgwWenKaiNerdFont/releases/download/${_tag}/lxgw-wenkai-nerd.zip" \
        "OFL.txt::https://raw.githubusercontent.com/Yikai-Liao/LxgwWenKaiNerdFont/${_tag}/OFL.txt")
sha256sums=('a8385f64befeea235debc878a8347427912b597eed7e2e0360b92c0487ccb6a5'
            'ef535bf1a3c546928f8e97570f2c72603185f88fa4d82a6df6708348ad4c7614')

package() {
  cd "${srcdir}"
  mkdir -p "${pkgdir}/usr/share/fonts/TTF"
  unzip -q "${srcdir}/lxgw-wenkai-nerd.zip" -d extracted
  find extracted -type f -name '*MonoNerdFont-*.ttf' -exec install -Dm644 {} "${pkgdir}/usr/share/fonts/TTF/" \;
  install -Dm644 OFL.txt "${pkgdir}/usr/share/licenses/${pkgname}/OFL.txt"
}
