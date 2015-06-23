# Maintainer: John Jenkins twodopeshaggy@gmail.com

pkgname=comicseer
pkgver=2.51
pkgrel=1
pkgdesc="Cross-platform comicbook reader (cbz pdf and more)"
arch=('i686' 'x86_64')
url="http://www.xylasoft.com/comicseer/index.php"
license=('CUSTOM')
depends=('qt4' 'zlib')
optdepends=('comictagger: For editing comic metadata')
if [ "$CARCH" == x86_64 ]; then
	source=(http://www.xylasoft.com/comicseer/downloads/ComicSeer_Linux_amd64_v${pkgver}-3.zip
	'comicseer.desktop')
sha1sums=('d8dc5c30c05c78d90b5ba96ba3385c67020d09b4'
	'9985b83ff76ff704d0965126858a6b85c7d30475')
elif [ "$CARCH" == i686 ]; then
	source=(http://www.xylasoft.com/comicseer/downloads/ComicSeer_Linux_i386_v${pkgver}-3.zip
	'comicseer.desktop')
sha1sums=('29c471d7c25d75b86002b5770cb6636d8dace77f'
	'9985b83ff76ff704d0965126858a6b85c7d30475')
fi
 
package() {
  cd ${srcdir}/
  mkdir -p ${pkgdir}/usr/bin
  
  # main executable
  install -Dm 755 comicseer ${pkgdir}/usr/bin
  
  # docs 
  mkdir -p ${pkgdir}/usr/share/doc/comicseer
  install -Dm 644 qtcopyright copyright Readme.txt ${pkgdir}/usr/share/doc/comicseer
  
  mkdir -p ${pkgdir}/usr/share/applications/
  # icon and application file
  install -Dm 644 XylasoftComicsLogo.png ${pkgdir}/usr/share/doc/comicseer/comicseer.png
  install -Dm 644 comicseer.desktop ${pkgdir}/usr/share/applications/
}
