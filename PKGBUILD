# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=texlive-garamondx
pkgver=1.099
pkgrel=3
pkgdesc="URW Garamond No8 Adobe Type1 fonts from CTAN (for texlive)"
arch=('any')
license=('CUSTOM:alladin')
url=http://www.ctan.org/tex-archive/fonts/crimson
depends=(texlive-core)
install=$pkgname.install
source=(http://mirrors.ctan.org/install/fonts/garamondx.tds.zip garamondx.maps)
md5sums=('1ced5a2bc4512dc5fc298ae21d717d63'
         '80761a71120a9861400927b591ac463f')
noextract=('garamondx.tds.zip')

package() {
  _texmf_root=usr/share/texmf-dist
  install -d "$pkgdir"/var/lib/texmf/arch/installedpkgs
  install -m644 "$srcdir"/garamondx.maps "$pkgdir"/var/lib/texmf/arch/installedpkgs
  install -d "$pkgdir"/$_texmf_root/
  cd "$pkgdir"/$_texmf_root/
  bsdtar xf "$srcdir"/garamondx.tds.zip
  install -Dm644 "$pkgdir"/$_texmf_root/doc/fonts/garamondx/README \
	  "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
  rm "$pkgdir"/$_texmf_root/doc/fonts/garamondx/README
}

