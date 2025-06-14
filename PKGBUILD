# Maintainer: Matrix <thysupremematrix atttttttttt tuta dottttttt io>

pkgname=gimp-plugin-gimp3-tools
pkgver=20250610T095711 # To get timestamp go to <https://sourceforge.net/p/gimp3-tools/activity/?page=0&limit=100>, inspect element the date (e.g. "2 months ago"), it should be in the attribute "datetime". Use ISO 8601 format <https://en.wikipedia.org/wiki/ISO_8601>.
pkgrel=1
epoch=1
pkgdesc="Ofnuts' Gimp Tools for Gimp 3"
arch=(any)
url='https://sourceforge.net/projects/gimp3-tools/files/'
license=('custom:none')
depends=('gimp>=3' python)
makedepends=('subversion')
options=(!strip)
_base_source='https://sourceforge.net/projects/gimp3-tools/files/'
# To get sources, you can do the command "curl "https://sourceforge.net/projects/gimp3-tools/rss?path=/" | grep "<link>.*</link>" | sed 's|<link>||;s|</link>||' | while read url; do url=`echo $url | sed 's|/download$||'`; echo $url ; done" then find and replace "https://sourceforge.net/projects/gimp3-tools/files/scripts" with nothing.
_source=(
	"general/ofn3-layer-tiles.zip"
	"management/ofn3-resource-manager.zip"
	"general/ofn3-export-layers.zip"
	"general/ofn3-list-guides.zip"
	"general/ofn3-align-layers.zip"
	"general/ofn3-colormap-to-paths.zip"
	"general/ofn3-interleave-layers.zip"
	"general/ofn3-mirror-layers.zip"
)
source=(
  "$pkgname-$pkgver-readme.md::${_base_source}/readme.md"
  "${_source[@]/#/${_base_source}}")
sha256sums=('1307f1cffdd4a1a173fe7014f60dbe40ec295f4e18c42db27049bffb8532bb4f'
            'dcc99e7dec2a87e943c14dea44031b439ce7c91655d0fdc6433c275ecff11125'
            '56a442e02a8df409ecf631df6fbee552083f4f8b3e67390088f705320cf7a6d2'
            'cb193403fe33e76765179fa597e0fe423715dcb58ab7d3a1341bd40c8014b4b8'
            '40fcbfaa2559c3711a3b7c1a61ff150693223c25b5361b7a6fc4dd238c496816'
            '9d9aafdd7f5d1620e454b7ed51a57fb1bec49c4643320341d3e6a03f37a9924f'
            'dcd2aeb0c9d73aab98ab581424d211825f9ca92da3d437f8e48f6be31631c72b'
            'ebb956addd973b1c08b32c20448f9120bb5020d2007a645bb6c470536a764a7e'
            'cd5f10f72012bcb073b838024de7c6c6e78586cba13860849e53b25dd0c41a7d')
            
package (){
  cd "$srcdir"
  _scriptsdir="$pkgdir"/usr/lib/gimp/3.0/plug-ins
  install -dm755 "$_scriptsdir"
  for i in */; do
    cp -R $i "$_scriptsdir"/$i
  done
  install -Dm644 "$pkgname-$pkgver-readme.md" "$pkgdir/usr/share/doc/$pkgname/readme.md"
}
