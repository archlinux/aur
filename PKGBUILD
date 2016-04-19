# Maintainer: David Verelst  <david.verelst@gmail.com>
# based on urw-garamond in AUR
pkgname=urw-arial
pkgver=20060321
pkgrel=1
depends=('texlive-core')
pkgdesc="URW Arial Type1 fonts from CTAN (for texlive)"
arch=('any')
license=('CUSTOM:alladin')
url="http://www.ctan.org/pkg/urw-arial"
depends=(texlive-core)
install=$pkgname.install
source=(http://mirrors.ctan.org/fonts/urw/arial.zip urw-arial.maps LICENSE)
md5sums=('4ad05e902e727fecc4f55f8d737e10a5'
         '14a40d8b0873eabaa33bfd1d6c5304f2'
         '5687e45ec13eb0290e38e48ce3903e47')

package() {
  cd "$srcdir"
  _texmf_root=usr/share/texmf-dist
  install -d -m755 "$pkgdir/var/lib/texmf/arch/installedpkgs"
  install -m 644 $pkgname.maps "$pkgdir/var/lib/texmf/arch/installedpkgs"

  install -d "$pkgdir/$_texmf_root/tex/latex/uarial"
  install -m 644 arial/latex/* $pkgdir/usr/share/texmf-dist/tex/latex/uarial

  install -d "$pkgdir/$_texmf_root/fonts/afm/urw/arial"
  install -d "$pkgdir/$_texmf_root/fonts/tfm/urw/arial"
  install -d "$pkgdir/$_texmf_root/fonts/type1/urw/arial"
  install -d "$pkgdir/$_texmf_root/fonts/vf/urw/arial"
  install -m 644 arial/afm/*.afm "$pkgdir/$_texmf_root/fonts/afm/urw/arial/"
  install -m 644 arial/tfm/*.tfm "$pkgdir/$_texmf_root/fonts/tfm/urw/arial/"
  install -m 644 arial/type1/*.pfb "$pkgdir/$_texmf_root/fonts/type1/urw/arial/"
  install -m 644 arial/vf/*.vf "$pkgdir/$_texmf_root/fonts/vf/urw/arial/"

  install -d "$pkgdir/$_texmf_root/fonts/map/dvips/uarial"
  install -m 644 arial/map/ua1.map "$pkgdir/$_texmf_root/fonts/map/dvips/uarial/"
  install -d "$pkgdir/$_texmf_root/fonts/map/pdftex/uarial"
  install -m 644 arial/map/ua1.map "$pkgdir/$_texmf_root/fonts/map/pdftex/uarial/"

  install -d "$pkgdir/$_texmf_root/fonts/map/vtex/uarial"
  install -m 644 arial/map/ua1.ali "$pkgdir/$_texmf_root/fonts/map/vtex/uarial/"

  install -D LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

