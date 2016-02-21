# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=texlive-crimson
pkgver=2016_02_19
pkgrel=1
pkgdesc="Texlive support for the Crimson Text family of fonts"
arch=('any')
license=('custom:Sil Open Font License')
url="http://www.ctan.org/tex-archive/fonts/crimson"
depends=('texlive-core')
install=$pkgname.install
source=("http://mirrors.ctan.org/fonts/crimson.zip" crimson.maps)
md5sums=('3343b4aad226e6bfc9d3451a77570730'
         'de444478d7a74f5ec986e3626e477137')

package() {
  _texmf_root=usr/share/texmf-dist
  _fontname=crimson
  cd ${_fontname}
   install -Dm644 "$srcdir"/${_fontname}/doc/OFL.txt \
	   "$pkgdir"/usr/share/licenses/$pkgname/OFL.txt
   install -d "$pkgdir"/$_texmf_root/doc/fonts/${_fontname}
  mv doc/* "$pkgdir"/$_texmf_root/doc/fonts/${_fontname}
  install -d "$pkgdir"/$_texmf_root/fonts/enc/dvips/${_fontname}
  mv enc/* "$pkgdir"/$_texmf_root/fonts/enc/dvips/${_fontname}
 install -d "$pkgdir"/$_texmf_root/fonts/tfm/public/${_fontname}
 mv tfm/* "$pkgdir"/$_texmf_root/fonts/tfm/public/${_fontname}
  install -d "$pkgdir"/$_texmf_root/fonts/type1/public/${_fontname}
  mv type1/* "$pkgdir"/$_texmf_root/fonts/type1/public/${_fontname}
  install -d "$pkgdir"/$_texmf_root/fonts/vf/public/${_fontname}
  mv vf/* "$pkgdir"/$_texmf_root/fonts/vf/public/${_fontname} 
  install -Dm644 map/${_fontname}.map \
	  "$pkgdir"/$_texmf_root/fonts/map/dvips/${_fontname}/${_fontname}.map
  install -d "$pkgdir"/var/lib/texmf/arch/installedpkgs
  install -m644 "$srcdir"/${_fontname}.maps "$pkgdir"/var/lib/texmf/arch/installedpkgs
  install -d "$pkgdir"/$_texmf_root/tex/latex/${_fontname}/
  mv latex/* "$pkgdir"/$_texmf_root/tex/latex/${_fontname}
 }

