# Maintainer:
# Contributor Gatlin Johnson <gatlin@niltag.net>

_fontname="comic-neue"
_pkgname="ttf-$_fontname"
pkgname="$_pkgname"
pkgver=2.51
pkgrel=1
pkgdesc="Casual font that fixes the shortcomings of Comic Sans"
url="https://github.com/crozynski/comicneue"
license=('OFL-1.1')
arch=('any')

_commit="1fa968608b1f4f7f1775824df3d2081fc93e2e9f" # 2.51

source=("ComicNeue-LICENSE-${_commit::7}.txt"::"$url/raw/$_commit/OFL.txt")
sha256sums=('7c38a22e5878e60fe423360553e63dd7be23d29f1f60336034935dbfc96e8320')

_files=(
  Fonts/TTF/ComicNeue/ComicNeue-Bold.ttf::'3e7e5fccfd7e0788f317b43312151c1bd5cf058c9697a8d83eac3939050bd61e'
  Fonts/TTF/ComicNeue/ComicNeue-BoldItalic.ttf::'5c312c2a2fa64eee82f3b87fcfab8f3b12a5e59b043124401d322eb323cfbf16'
  Fonts/TTF/ComicNeue/ComicNeue-Italic.ttf::'e06bfd1552f5c9464c5665733ffd69239b0593885dbb9e059688a5900f78cf98'
  Fonts/TTF/ComicNeue/ComicNeue-Light.ttf::'efb91c06dccc264f07f800c0691d40c94e8cfce6183daade0709268bec178f76'
  Fonts/TTF/ComicNeue/ComicNeue-LightItalic.ttf::'a6d36baee09c7025916ddb517835458d15ef890291507197a54875ccc096b927'
  Fonts/TTF/ComicNeue/ComicNeue-Regular.ttf::'a0ee5a37c8b27c4db0700137d928598b1e23b0089e1546a8961909176b779360'
  Fonts/TTF/ComicNeue-Angular/ComicNeueAngular-Bold.ttf::'cee03f39ac83f957269ba2e5b3f38633109c5a34a05b7cf0a75764c1cc6e6fea'
  Fonts/TTF/ComicNeue-Angular/ComicNeueAngular-BoldItalic.ttf::'48ae749cb2e522694c2912dc3be1dd20eca2735b1c5a2dce02788f345f112e8b'
  Fonts/TTF/ComicNeue-Angular/ComicNeueAngular-Italic.ttf::'e30086fbee8befd17da2a2c32ca1274010558718b29e6889f6971e4885d07a12'
  Fonts/TTF/ComicNeue-Angular/ComicNeueAngular-Light.ttf::'3b306a9f53674bb0423a5c63ef7102b1ec562786ac950f776d7e4ad6c4d23602'
  Fonts/TTF/ComicNeue-Angular/ComicNeueAngular-LightItalic.ttf::'88914050ace5ee82c48ff46aa0c5ea699ef0ffbf4baf0d792104dfe4f24f1de3'
  Fonts/TTF/ComicNeue-Angular/ComicNeueAngular-Regular.ttf::'3f3dc75cc9376e1434f1c19c315942240f0a2eb96f3f12fbfad0bc07f9f87f2f'
)

for i in "${_files[@]}"; do
  _dl_path="${i%::*}"
  _file="${_dl_path##*/}"
  _hash="${i#*::}"
  source+=("${_file%.ttf}-${_commit::7}.ttf"::"$url/raw/$_commit/$_dl_path")
  sha256sums+=("$_hash")
done

package() {
  for i in ComicNeue*-${_commit::7}.ttf; do
    install -Dm644 "$i" "$pkgdir/usr/share/fonts/$_fontname/${i%-${_commit::7}.ttf}.ttf"
  done

  install -Dm644 "ComicNeue-LICENSE-${_commit::7}.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
