# Maintainer: Murat Çileli <murat.cileli@gmail.com>

pkgbase="ttf-op-slate"
pkgname="ttf-op-slate"
pkgver="0.5"
pkgrel="1"
pkgdesc="The font that comes with OnePlus Phones"
arch=("x86_64")
license=("MIT")
url="https://drive.google.com/folderview?id=0B9UzADWnkrLHM0UtZWZTa0poTTA"
makedepends=()
provides=("ttf-op-slate")

source=(
  "SlateForOnePlus-Black.ttf"
  "SlateForOnePlus-Bold.ttf"
  "SlateForOnePlus-Book.ttf"
  "SlateForOnePlus-Light.ttf"
  "SlateForOnePlus-Medium.ttf"
  "SlateForOnePlus-Regular.ttf"
  "SlateForOnePlus-Thin.ttf"
)

sha256sums=(
  "94f5498ef5d2fc2a5fbb1254b5b09c7d51150cb61590cf57726f7062d941a13e"
  "46f776e953487ac7fa75961f0f6ee31619539e50a872d0f7067140bf8cb7aa4e"
  "89fdc9221a55c2710d4b66740bd63cdedf17b3f795409516c2c95e4e59d2aa06"
  "3105771a2e1805cba05fb3b2a5b3b109b12be7ee9616ca0480aaaccc3f7f42df"
  "02cd1bae34d6643e672775684d5f49806f7929bb760e64f2ec24ce206385279c"
  "ab611a93d9d92bb2faf716c9672ee45c7307f2ab9be3b302b1d46b07e29f3cac"
  "fb04f2f9d6a95e72a4b7f635ff235227dc477bbb85fedcb62f918924f817c902"
)

package() {
  cd $srcdir
  install -dm755 "$pkgdir/usr/share/fonts/TTF"
  for font in $(find *.ttf)
  do
    dest=$(echo $font | grep -P -o "(?<=For).*$")
    echo "Installing $font -> /usr/share/fonts/TTF/$dest"
    install -m644 "$font" "$pkgdir/usr/share/fonts/TTF/$dest"
  done
}