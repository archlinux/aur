# Maintainer: Emma Tebibyte <emma@tebibyte.media>

pkgname="use-system-electron"
pkgver=20
pkgrel=1
pkgdesc="Symlinks the system's electron to all existing versions."
arch=("any")
license=("Unlicense")
depends=("electron20")
conflicts=("electron3" "electron4" "electron5" "electron6" "electron7" "electron8" "electron9" "electron10" "electron11" "electron12" "electron13" "electron14" "electron15" "electron16" "electron17" "electron18" "electron19")
provides=("electron3" "electron4" "electron5" "electron6" "electron7" "electron8" "electron9" "electron10" "electron11" "electron12" "electron13" "electron14" "electron15" "electron16" "electron17" "electron18" "electron19")

package() {
  install -dm755 "${pkgdir}/usr/bin"
  for num in {2..19}
  do
  ln -s /usr/bin/electron "electron${num}"
  mv "electron$num" "${pkgdir}/usr/bin/"
  done
}